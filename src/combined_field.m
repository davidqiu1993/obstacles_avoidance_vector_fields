function [v] = combined_field(goal, lst_obs, loc)

%f_obs = @obs_field_radiation;
%f_obs = @obs_field_vortex;
f_obs = @obs_field_hybrid;

v = goal_field_absorption(goal, loc) * 1;

for i_obs = 1:size(lst_obs,1)
     v = v + f_obs(lst_obs(i_obs,:), loc);
end


function [v] = obs_field_hybrid(obs, loc)

v = obs_field_radiation(obs, loc) + obs_field_vortex(obs, loc);

end

end
