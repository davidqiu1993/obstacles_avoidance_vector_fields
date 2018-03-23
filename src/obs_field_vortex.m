function [v] = obs_field_vortex(obs, loc)

R = [0, -1;
     1,  0];

p = R * (loc - obs)';
v = p / (norm(p)^2);
v = v';

end
