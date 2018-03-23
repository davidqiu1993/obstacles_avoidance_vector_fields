function [v] = goal_field_absorption(goal, loc)

v = (goal - loc) / norm(goal - loc);

end
