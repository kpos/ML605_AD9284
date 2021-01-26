
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Test01 -dir "D:/GIT/ML605_AD9284/HDL/Test01/planAhead_run_1" -part xc6vlx240tff1156-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/GIT/ML605_AD9284/HDL/Test01/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/GIT/ML605_AD9284/HDL/Test01} }
set_property target_constrs_file "ML605_FMCint_AD9284.ucf" [current_fileset -constrset]
add_files [list {ML605_FMCint_AD9284.ucf}] -fileset [get_property constrset [current_run]]
link_design
