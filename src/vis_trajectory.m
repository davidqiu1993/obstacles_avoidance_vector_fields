function vis_combined_field(p0, pg, lst_obs, T, k)

if ~exist('T', 'var')
    T = 100;
end
if ~exist('k', 'var')
    k = 0.1; % control gain
end

if ~exist('p0', 'var')
    p0 = [0,0];
end
if ~exist('pg', 'var')
    pg = [8,8];
end
if ~exist('lst_obs', 'var')
    lst_obs = [3,4;
               5,5];
end

u = @combined_field;

traj = zeros(T, 2);

x = p0;
traj(1,:) = x;
for t = 2:T
    u_raw = u(pg, lst_obs, x);
    u_norm = u_raw / norm(u_raw);
    x = x + u_norm * k;
    traj(t,:) = x;
end

vis_combined_field(pg, lst_obs);
hold on;
plot(traj(:,1), traj(:,2));
hold off;
