## Setup

# install.packages("bupaR")
# install.packages("edeaR")
# install.packages("eventdataR")
# install.packages("processmapR")
# install.packages("processmonitR")
# install.packages("xesreadR")
# install.packages("petrinetR")
# install.packages("pm4py")
# pm4py::install_pm4py()


## Conformance - White

library(bupaR)
library(pm4py)
library(petrinetR)

bobby_fischer_w <- read_xes("bobby_fischer/df_white.xes")
alfons2357_w <- read_xes("alfons2357/df_white.xes")

model_bobby_w <- discovery_inductive(bobby_fischer_w)

conf_align <- conformance_alignment(alfons2357_w, 
                                    model_bobby_w$petrinet, 
                                    model_bobby_w$inital_marking, 
                                    model_bobby_w$final_marking)

head(conf_align)

# case_id  log_id                             model_id log_label model_label  cost visited_states queued_states
# 1       1      >>                                tau_1        >>        <NA> 20018             42           196
# 2       1      >>                          init_loop_3        >>        <NA> 20018             42           196
# 3       1  t_e4_0 860f43a5-886f-4007-93a0-eeff1926be2d        e4          e4 20018             42           196
# 4       1      >>                               skip_5        >>        <NA> 20018             42           196
# 5       1      >>                               loop_4        >>        <NA> 20018             42           196
# 6       1 t_Nf3_1 f502e170-50d9-4436-b14a-ab9cc85508fa       Nf3         Nf3 20018             42           196
# traversed_arcs   fitness
# 1            973 0.8181818
# 2            973 0.8181818
# 3            973 0.8181818
# 4            973 0.8181818
# 5            973 0.8181818
# 6            973 0.8181818

evaluation_fitness(alfons2357_w, 
                   model_bobby_w$petrinet, 
                   model_bobby_w$inital_marking, 
                   model_bobby_w$final_marking)

# $perc_fit_traces
# [1] 0
# 
# $average_trace_fitness
# [1] 0.9798499
# 
# $log_fitness
# [1] 0.9804688

evaluation_precision(alfons2357_w, 
                     model_bobby_w$petrinet, 
                     model_bobby_w$inital_marking, 
                     model_bobby_w$final_marking)

# [1] 1

evaluation_all(alfons2357_w, 
               model_bobby_w$petrinet, 
               model_bobby_w$inital_marking, 
               model_bobby_w$final_marking)

# $fitness
# $fitness$perc_fit_traces
# [1] 0
# 
# $fitness$average_trace_fitness
# [1] 0.9798499
# 
# $fitness$log_fitness
# [1] 0.9804688
# 
# 
# $precision
# [1] 1
# 
# $generalization
# [1] 0.1073271
# 
# $simplicity
# [1] 0.3604651
# 
# $metricsAverageWeight
# [1] 0.6120653
# 
# $fscore
# [1] 0.9901381

## Conformance - White

bobby_fischer_b <- read_xes("bobby_fischer/df_black.xes")
alfons2357_b <- read_xes("alfons2357/df_black.xes")

model_bobby_b <- discovery_inductive(bobby_fischer_b)

conf_align <- conformance_alignment(alfons2357_b, 
                                    model_bobby_b$petrinet, 
                                    model_bobby_b$inital_marking, 
                                    model_bobby_b$final_marking)

head(conf_align)

# case_id log_id                             model_id log_label model_label  cost visited_states queued_states
# 1       2     >>                                tau_1        >>        <NA> 30016             26           161
# 2       2     >>                          init_loop_3        >>        <NA> 30016             26           161
# 3       2 t_c6_0 6a836553-82d1-404b-adef-700e156afb58        c6          c6 30016             26           161
# 4       2     >>                               skip_5        >>        <NA> 30016             26           161
# 5       2     >>                               loop_4        >>        <NA> 30016             26           161
# 6       2 t_d5_1 5580c5ea-0319-484d-ba80-eb8b346981d5        d5          d5 30016             26           161
# traversed_arcs   fitness
# 1            767 0.7272727
# 2            767 0.7272727
# 3            767 0.7272727
# 4            767 0.7272727
# 5            767 0.7272727
# 6            767 0.7272727

evaluation_fitness(alfons2357_b, 
                   model_bobby_b$petrinet, 
                   model_bobby_b$inital_marking, 
                   model_bobby_b$final_marking)

# $perc_fit_traces
# [1] 0
# 
# $average_trace_fitness
# [1] 0.9788117
# 
# $log_fitness
# [1] 0.9794304

evaluation_precision(alfons2357_b, 
                     model_bobby_b$petrinet, 
                     model_bobby_b$inital_marking, 
                     model_bobby_b$final_marking)

# [1] 1

evaluation_all(alfons2357_b, 
               model_bobby_b$petrinet, 
               model_bobby_b$inital_marking, 
               model_bobby_b$final_marking)

# $fitness
# $fitness$perc_fit_traces
# [1] 0
# 
# $fitness$average_trace_fitness
# [1] 0.9788117
# 
# $fitness$log_fitness
# [1] 0.9794304
# 
# 
# $precision
# [1] 1
# 
# $generalization
# [1] 0.1123103
# 
# $simplicity
# [1] 0.3630573
# 
# $metricsAverageWeight
# [1] 0.6136995
# 
# $fscore
# [1] 0.9896083