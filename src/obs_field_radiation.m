function [v] = obs_field_radiation(obs, loc)

v = (loc - obs) / (norm(loc - obs)^2);

end
