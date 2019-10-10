clear all;
clf;
clc;

%========= discrete event simulation of the three callers =========== 
%========Use realistic simulation considering three caller's action===

lambda = 0.125;  mu = 0.2;

% theoretical results
Q = [-3*lambda,  3*lambda,      0,              0,           0,             0; ...
     mu,         -mu-2*lambda,  2*lambda,       0,           0,             0; ...
     0,          2*mu,          -2*mu-lambda,   lambda,      0,             0; ...
     0,          0,             0,              -2*mu,       2*mu,          0;...
     0,          0,             2*lambda,       lambda,      -mu-3*lambda,  mu; ...
     0,          2*lambda,      0,              0,           2*lambda,      -4*lambda    ];

Pi_theory = zeros(1, 6);
Q_m = [Q(:, 1:5)  ones(6,1)];
B = [0 0 0 0 0 1];
Pi_theory = B * inv(Q_m);

%-------------------------------------------
%--- discrete event simulation -------------
stateN = 6; 
N = 10000;  % N is the number of transitions.
lambda = 0.125;  
mu = 0.2;
Tran = zeros(N,1); 
State = zeros(N,1);
currentTime = 0; 
EventList = zeros(3,1);

% initialize system's state
initState = 1;      
Caller = ['P' 'P' 'P']; 
serveLineNum = 0;

%  status:  P - idle with patience
%           C - calling  ( in service )
%           I - impatiently waiting 
EventList(1) = -log(rand)/lambda;
EventList(2) = -log(rand)/lambda;
EventList(3) = -log(rand)/lambda;
% Each EventList entry should be assigned individually based on its
% caller's status.

for i=1:N   % simulate N transitions
    % find the smallest event time in the EventList
    [nextT, k] = min(EventList);
    currentTime = EventList(k);
    % update caller k's status
    switch(Caller(k))
        case 'P'    % the action is a call attempt
            if serveLineNum <2      % there are still line available
                Caller(k) = 'C';    % the caller uses an available line
                serveLineNum = serveLineNum + 1;
                % the next event happens after the caller finishes service
                EventList(k) = -log(rand)/mu + currentTime;
            else
                Caller(k) = 'I';    %blocked, become impatient
                % the next event happens when the impatient caller calls
                % again
                EventList(k) = -log(rand)/(2*lambda) + currentTime;
            end
        case 'I'    % the action is a call attempt
            if serveLineNum <2      % there are still line available
                Caller(k) = 'C';    % the caller uses an available line
                serveLineNum = serveLineNum + 1;
                % the next event happens after the caller finishes service
                EventList(k) = -log(rand)/mu + currentTime;
            else
                Caller(k) = 'I'; %blocked, become impatient
                % the next event happens when the impatient caller calls
                % again
                EventList(k) = -log(rand)/(2*lambda) + currentTime;
            end
        case 'C'	% the action is finishing phone call
            serveLineNum = serveLineNum - 1;
            Caller(k) = 'P';
            % the next call attempt happens after exp. distr. time with rate
            % lambda
            EventList(k) = -log(rand)/lambda + currentTime; 
    end
    
    % update output data
    Tran(i) = currentTime;
    if serveLineNum == 0	% 0 calls in progress, either state 1 or 6
        if Caller(1) == 'P' && Caller(2) == 'P' && Caller(3) == 'P'
            State(i) = 1;
        else
            State(i) = 6;
        end
    elseif serveLineNum == 1	% either state 2 or 5
        if Caller(1) == 'I' || Caller(2) == 'I' || Caller(3) == 'I'
            State(i) = 5;
        else
            State(i) = 2;
        end
    else	% either state 3 or 4
        if Caller(1) == 'P' || Caller(2) == 'P' || Caller(3) == 'P'
            State(i) = 3;
        else
            State(i) = 4;
        end
    end
end

Time = zeros(6,1); 
Time(initState) = Tran(1); 
for k=1:6
    for i=1:N-1
        if State(i) == k
            duration = Tran(i+1) - Tran(i);
            Time(k) = Time(k) + duration;
        end
    end
end

Pi_simul = zeros(6,1);
Pi_simul = Time./Tran(N);

figure; hold on; 
plot(Pi_theory, '-ob'); plot(Pi_simul, '--^k');
legend('Theoretical', 'Simulation');

