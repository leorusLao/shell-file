#!/bin/bash

tput civis; #设置光标不可见

tput clear

echo -e "\033[36m Starvation poses a fundamental challenge to cell survival. Whereas the role of autophagy in promoting energy homeostasis in this setting has been extensively characterized1, other mechanisms are less well understood. Here we reveal that glyceraldehyde 3-phosphate dehydrogenase (GAPDH) inhibits coat protein I (COPI) transport by targeting a GTPase-activating protein (GAP) towards ADP-ribosylation factor 1 (ARF1) to suppress COPI vesicle fission. GAPDH inhibits multiple other transport pathways, also by targeting ARF GAPs. Further characterization suggests that this broad inhibition is activated by the cell during starvation to reduce energy consumption. These findings reveal a remarkable level of coordination among the intracellular transport pathways that underlies a critical mechanism of cellular energy homeostasis. \033[0m" | pv -qL 10


