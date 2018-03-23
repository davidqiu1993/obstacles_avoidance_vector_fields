function vis_field(f, ref)

if ~exist('f', 'var')
    %f = @obs_field_radiation;
    f = @obs_field_vortex;
    %f = @goal_field_absorption;
end

if ~exist('ref', 'var')
    ref = [3,4];
end

[loc_x, loc_y] = meshgrid(0:0.25:10, 0:0.25:10);

V = zeros([size(loc_x), 2]); % vector field

for y = 1:size(V,1)
    for x = 1:size(V,2)
        fv = f(ref, [loc_x(y,x), loc_y(y,x)]);
        V(y,x,:) = fv; % without normalization
        %V(y,x,:) = fv / norm(fv); % with normalization
    end
end

figure
quiver(loc_x, loc_y, V(:,:,1), V(:,:,2));

end
