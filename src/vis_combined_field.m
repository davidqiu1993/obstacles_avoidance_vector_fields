function vis_combined_field(goal, lst_obs)

[loc_x, loc_y] = meshgrid(0:0.2:10, 0:0.2:10);

if ~exist('goal', 'var')
    goal = [8,9];
end

if ~exist('lst_obs', 'var')
    lst_obs = [3,4;
               5,5];
end

V = zeros([size(loc_x), 2]); % vector field

for y = 1:size(V,1)
    for x = 1:size(V,2)
        fv = combined_field(goal, lst_obs, [loc_x(y,x), loc_y(y,x)]);
        %V(y,x,:) = fv; % without normalization
        V(y,x,:) = fv / norm(fv); % with normalization
    end
end

figure
quiver(loc_x, loc_y, V(:,:,1), V(:,:,2));

end
