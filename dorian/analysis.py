

#%% 
from pm4py.objects.log.importer.xes import importer as xes_importer
from pm4py.algo.discovery.alpha import algorithm as alpha_miner
from pm4py.algo.discovery.inductive import algorithm as inductive_miner
from pm4py.algo.conformance.tokenreplay import algorithm as token_replay
from pm4py.evaluation.replay_fitness import evaluator as replay_fitness_evaluator

#%%
log = xes_importer.apply("C54_log.xes")
log_alfons_small = xes_importer.apply("enrich_df_alfons_small.xes")
log_alfons_italian = xes_importer.apply("enrich_df_alfons_italian-game.xes")
results = {}

#%%
filename = "result_im.json"
net, initial_marking, final_marking = inductive_miner.apply(log)

#%%
replayed_traces = token_replay.apply(log, net, initial_marking, final_marking)
M = sum([trace['missing_tokens'] for trace in replayed_traces])
C = sum([trace['consumed_tokens'] for trace in replayed_traces])
R = sum([trace['remaining_tokens'] for trace in replayed_traces])
P = sum([trace['produced_tokens'] for trace in replayed_traces])
fitness_log_net_tbr = 1/2 * ( 1-(M/C) ) + 1/2 * ( 1-(R/P) )  

#%%
# fit log against model
fitness_eval_TOKEN_BASED = replay_fitness_evaluator.apply(
    log, net, 
    initial_marking, final_marking,
    variant=replay_fitness_evaluator.Variants.TOKEN_BASED)
results['1-log-token_based'] = fitness_eval_TOKEN_BASED
fitness_eval_ALIGNMENT_BASED = replay_fitness_evaluator.apply(
    log, net, 
    initial_marking, final_marking,
    variant=replay_fitness_evaluator.Variants.ALIGNMENT_BASED)
results['1-log-alignment_based'] = fitness_eval_ALIGNMENT_BASED

#%%
# fit alfons small against model
fitness_eval_TOKEN_BASED = replay_fitness_evaluator.apply(
    log_alfons_small, net, 
    initial_marking, final_marking,
    variant=replay_fitness_evaluator.Variants.TOKEN_BASED)
results['2-log_alfons_small-token_based'] = fitness_eval_TOKEN_BASED
fitness_eval_ALIGNMENT_BASED = replay_fitness_evaluator.apply(
    log_alfons_small, net, 
    initial_marking, final_marking,
    variant=replay_fitness_evaluator.Variants.ALIGNMENT_BASED)
results['2-log_alfons_small-alignment_based'] = fitness_eval_ALIGNMENT_BASED


# %%
# fit alfons small against model
fitness_eval_TOKEN_BASED = replay_fitness_evaluator.apply(
    log_alfons_italian, net, 
    initial_marking, final_marking,
    variant=replay_fitness_evaluator.Variants.TOKEN_BASED)
results['3-log_alfons_italian_small-token_based'] = fitness_eval_TOKEN_BASED
fitness_eval_ALIGNMENT_BASED = replay_fitness_evaluator.apply(
    log_alfons_italian, net, 
    initial_marking, final_marking,
    variant=replay_fitness_evaluator.Variants.ALIGNMENT_BASED)
results['3-log_alfons_italian_small-alignment_based'] = fitness_eval_ALIGNMENT_BASED

#%%
import json
with open(filename, 'w') as fp:
    json.dump(results, fp)