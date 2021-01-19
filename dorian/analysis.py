

#%% 
from pm4py.objects.log.importer.xes import importer as xes_importer
from pm4py.algo.discovery.alpha import algorithm as alpha_miner
from pm4py.algo.discovery.inductive import algorithm as inductive_miner
from pm4py.algo.discovery.heuristics import algorithm as heuristics_miner
from pm4py.algo.conformance.tokenreplay import algorithm as token_replay
from pm4py.evaluation.replay_fitness import evaluator as replay_fitness_evaluator
from pm4py.visualization.petrinet import visualizer as pn_visualizer
from pm4py.visualization.process_tree import visualizer as pt_visualizer
from pm4py.visualization.heuristics_net import visualizer as hn_visualizer

#%%
# CONFIGURATION 
log = xes_importer.apply("C54_log.xes")
log_alfons_small = xes_importer.apply("enrich_df_alfons_small.xes")
log_alfons_italian = xes_importer.apply("enrich_df_alfons_italian-game.xes")
results = {}

filename = None
#filename = "result_am.json"
#filename = "result_im.json"
#filename = "result_hm.json"

net = initial_marking = final_marking = None

#net, initial_marking, final_marking = alpha_miner.apply(log)

# net, initial_marking, final_marking = inductive_miner.apply(log)
# tree = inductive_miner.apply_tree(log)
# gviz = pt_visualizer.apply(tree)
# pt_visualizer.view(gviz)

net, initial_marking, final_marking = heuristics_miner.apply(log, parameters={heuristics_miner.Variants.CLASSIC.value.Parameters.DEPENDENCY_THRESH: 0.99})
heu_net = heuristics_miner.apply_heu(log, parameters={heuristics_miner.Variants.CLASSIC.value.Parameters.DEPENDENCY_THRESH: 0.99})
gviz = hn_visualizer.apply(heu_net)
hn_visualizer.view(gviz)

if (net and initial_marking and final_marking) is None: 
    raise Exception("This is for your safety. Check configuration")

#%%
gviz = pn_visualizer.apply(net, initial_marking, final_marking)
pn_visualizer.view(gviz)

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
# fit alfons italian against model
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
# import json
# with open(filename, 'w') as fp:
#     json.dump(results, fp)



###############################################################################



