%% Clear all variables.
clearvars;

%% Create the nodes of Bayesian network.
% Create the attack nodes.
NodeType = Enumerations.NodeType.Attack;
a01 = Classes.Node('Network Scanning',                  NodeType);
a02 = Classes.Node('Vulnerability scanning',            NodeType);
a03 = Classes.Node('Buffer overflow attack on HDS',     NodeType);
a04 = Classes.Node('FTP attack on HDS',                 NodeType);
a05 = Classes.Node('Brute force attack on HDS',         NodeType);
a06 = Classes.Node('DoS attack on HDS',                 NodeType);
a07 = Classes.Node('Buffer overflow attack on ES',      NodeType);
a08 = Classes.Node('Privilege escalation attack on ES', NodeType);
a09 = Classes.Node('Spoofing attack on ES',             NodeType);
a10 = Classes.Node('DoS attack on PLC1',                NodeType);
a11 = Classes.Node('DoS attack on PLC2',                NodeType);
a12 = Classes.Node('DoS attack on PLC3',                NodeType);
a13 = Classes.Node('DoS attack on PLC4',                NodeType);
a14 = Classes.Node('DoS attack on PLC5',                NodeType);
a15 = Classes.Node('DoS attack on PLC6',                NodeType);
a16 = Classes.Node('Reconfiguration of PLC1',           NodeType);
a17 = Classes.Node('Reconfiguration of PLC2',           NodeType);
a18 = Classes.Node('Reconfiguration of PLC3',           NodeType);
a19 = Classes.Node('Reconfiguration of PLC4',           NodeType);
a20 = Classes.Node('Reconfiguration of PLC5',           NodeType);
a21 = Classes.Node('Reconfiguration of PLC6',           NodeType);
a22 = Classes.Node('Man-in-the-middle attack on PLC1',  NodeType);
a23 = Classes.Node('Man-in-the-middle attack on PLC2',  NodeType);
a24 = Classes.Node('Man-in-the-middle attack on PLC3',  NodeType);
a25 = Classes.Node('Man-in-the-middle attack on PLC4',  NodeType);
a26 = Classes.Node('Man-in-the-middle attack on PLC5',  NodeType);
a27 = Classes.Node('Man-in-the-middle attack on PLC6',  NodeType);

% Create the resource nodes.
NodeType = Enumerations.NodeType.Resource;
r01 = Classes.Node('IP addresses of HDS and ES',        NodeType);
r02 = Classes.Node('Buffer overflow vulnerability',     NodeType);
r03 = Classes.Node('FTP server vulnerability',          NodeType);
r04 = Classes.Node('Login vulnerability',               NodeType);
r05 = Classes.Node('Buffer overflow vulnerability',     NodeType);
r06 = Classes.Node('Authentication vulnerability',      NodeType);
r07 = Classes.Node('Administrator authority of HDS',    NodeType);
r08 = Classes.Node('Crash of HDS',                      NodeType);
r09 = Classes.Node('Administrator authority of ES',     NodeType);

% Create the function nodes.
NodeType = Enumerations.NodeType.Function;
f01 = Classes.Node('Traffic control of V1',             NodeType);
f02 = Classes.Node('Traffic control of V2',             NodeType);
f03 = Classes.Node('Traffic control of V3',             NodeType);
f04 = Classes.Node('Pressure reducing',                 NodeType);
f05 = Classes.Node('Heating function',                  NodeType);
f06 = Classes.Node('Mixing function',                   NodeType);
f07 = Classes.Node('Liquid level sensation',            NodeType);
f08 = Classes.Node('Temperature sensation',             NodeType);
f09 = Classes.Node('Pressure sensation',                NodeType);
f10 = Classes.Node('Liquid level control',              NodeType);
f11 = Classes.Node('Temperature control',               NodeType);
f12 = Classes.Node('Pressure control',                  NodeType);

% Create the incident nodes.
NodeType = Enumerations.NodeType.Incident;
e01 = Classes.Node('Excessive liquid level',            NodeType);
e02 = Classes.Node('Low liquid level',                  NodeType);
e03 = Classes.Node('Temperature anomaly',               NodeType);
e04 = Classes.Node('Excessive pressure',                NodeType);
e05 = Classes.Node('Heater dry fired',                  NodeType);
e06 = Classes.Node('Reactor explosion',                 NodeType);
e07 = Classes.Node('Liquid overflow',                   NodeType);
e08 = Classes.Node('Blender stop',                      NodeType);

% Create the asset nodes.
NodeType = Enumerations.NodeType.Asset;
x01 = Classes.Node('Product damaged',                   NodeType, 50000  );
x02 = Classes.Node('Tank damaged',                      NodeType, 500000 );
x03 = Classes.Node('Heater damaged',                    NodeType, 10000  );
x04 = Classes.Node('Sensors damaged',                   NodeType, 10000  );
x05 = Classes.Node('Staff1-4 injured',                  NodeType, 800000 );
x06 = Classes.Node('Staff5-9 injured',                  NodeType, 1000000);
x07 = Classes.Node('Water pollution',                   NodeType, 200000 );
x08 = Classes.Node('Air pollution',                     NodeType, 200000 );  

%% Set the conditional probabilities of nodes
% Set attack nodes.
a01.AddAllParents(... Has no parent node
    0.00000001);

a02.AddAllParents(r01, ...
    0.00000001, ... F
    0.99999900);  % T

a03.AddAllParents(r01, r02, ...
    0.00000001, ... F    F
    0.65000000, ... F    T
    0.00000001, ... T    F
    0.65000000);  % T    T

a04.AddAllParents(r01, r03, ...
    0.00000001, ... F    F
    0.65000000, ... F    T
    0.00000001, ... T    F
    0.65000000);  % T    T

a05.AddAllParents(r01, r04, ...
    0.00000001, ... F    F
    0.65000000, ... F    T
    0.00000001, ... T    F
    0.65000000);  % T    T

a06.AddAllParents(r01, ...
    0.00000001, ... F
    0.10000000);  % T

a07.AddAllParents(r01, r05, ...
    0.00000001, ... F    F
    0.65000000, ... F    T
    0.00000001, ... T    F
    0.65000000);  % T    T

a08.AddAllParents(r01, r06, r07, ...
    0.00000001, ... F    F    F
    0.00000001, ... F    F    T
    0.00000001, ... F    T    F
    0.00000001, ... F    T    T
    0.00000001, ... T    F    F
    0.00000001, ... T    F    T
    0.00000001, ... T    T    F
    0.80000000);  % T    T    T

a09.AddAllParents(r01, r06, r08, ...
    0.00000001, ... F    F    F
    0.00000001, ... F    F    T
    0.00000001, ... F    T    F
    0.00000001, ... F    T    T
    0.00000001, ... T    F    F
    0.00000001, ... T    F    T
    0.00000001, ... T    T    F
    0.80000000);  % T    T    T

a10.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a11.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a12.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a13.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a14.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a15.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a16.AddAllParents(r09, ...
    0.00000001, ... F
    0.30000000);  % T

a17.AddAllParents(r09, ...
    0.00000001, ... F
    0.30000000);  % T

a18.AddAllParents(r09, ...
    0.00000001, ... F
    0.30000000);  % T

a19.AddAllParents(r09, ...
    0.00000001, ... F
    0.30000000);  % T

a20.AddAllParents(r09, ...
    0.00000001, ... F
    0.30000000);  % T

a21.AddAllParents(r09, ...
    0.00000001, ... F
    0.30000000);  % T

a22.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a23.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a24.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a25.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a26.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

a27.AddAllParents(r07, r09, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.30000000);  % T    T

% Set resource nodes.
r01.AddAllParents(a01, ...
    0.00000001, ... F
    0.99999900);  % T

r02.AddAllParents(a02, ...
    0.00000001, ... F
    0.60000000);  % T

r03.AddAllParents(a02, ...
    0.00000001, ... F
    0.60000000);  % T

r04.AddAllParents(a02, ...
    0.00000001, ... F
    0.60000000);  % T

r05.AddAllParents(a02, ...
    0.00000001, ... F
    0.60000000);  % T

r06.AddAllParents(a02, ...
    0.00000001, ... F
    0.60000000);  % T

r07.AddAllParents(a03, a04, a05, ...
    0.00000001, ... F    F    F
    0.20000000, ... F    F    T
    0.10000000, ... F    T    F
    0.50000000, ... F    T    T
    0.10000000, ... T    F    F
    0.50000000, ... T    F    T
    0.50000000, ... T    T    F
    0.90000000);  % T    T    T

r08.AddAllParents(a06, ...
    0.00000001, ... F
    0.80000000);  % T

r09.AddAllParents(a07, a08, a09, ...
    0.00000001, ... F    F    F
    0.80000000, ... F    F    T
    0.10000000, ... F    T    F
    0.86000000, ... F    T    T
    0.80000000, ... T    F    F
    0.85000000, ... T    F    T
    0.90000000, ... T    T    F
    0.92000000);  % T    T    T 

% Set function nodes.
f01.AddAllParents(a10, a16, a22, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f02.AddAllParents(a10, a16, a22, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f03.AddAllParents(a15, a21, a27, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f04.AddAllParents(a14, a20, a26, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f05.AddAllParents(a13, a19, a25, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f06.AddAllParents(a12, a18, a24, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f07.AddAllParents(a11, a17, a23, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f08.AddAllParents(a11, a17, a23, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f09.AddAllParents(a11, a17, a23, ...
    0.00000001, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.60000000, ... F    T    T
    0.30000000, ... T    F    F
    0.60000000, ... T    F    T
    0.60000000, ... T    T    F
    0.88500000);  % T    T    T

f10.AddAllParents(f01, f02, f03, f07, ...
    0.00000001, ... F    F    F    F
    0.00000002, ... F    F    F    T
    0.00000003, ... F    F    T    F
    0.55000000, ... F    F    T    T
    0.00000002, ... F    T    F    F
    0.36000000, ... F    T    F    T
    0.66000000, ... F    T    T    F
    0.85000000, ... F    T    T    T
    0.00000001, ... T    F    F    F
    0.33000000, ... T    F    F    T
    0.46000000, ... T    F    T    F
    0.86000000, ... T    F    T    T
    0.50000000, ... T    T    F    F
    0.68000000, ... T    T    F    T
    0.86000000, ... T    T    T    F
    0.86000000);  % T    T    T    T

f11.AddAllParents(f01, f02, f03, f05, f08, ...
    0.00000001, ... F    F    F    F    F
    0.00000003, ... F    F    F    F    T
    0.00000004, ... F    F    F    T    F
    0.25000000, ... F    F    F    T    T
    0.00000006, ... F    F    T    F    F
    0.22560000, ... F    F    T    F    T
    0.40000000, ... F    F    T    T    F
    0.02300000, ... F    F    T    T    T
    0.00000003, ... F    T    F    F    F
    0.20000000, ... F    T    F    F    T
    0.45000000, ... F    T    F    T    F
    0.47000000, ... F    T    F    T    T
    0.00600000, ... F    T    T    F    F
    0.35000000, ... F    T    T    F    T
    0.30550000, ... F    T    T    T    F
    0.65000000, ... F    T    T    T    T
    0.00000002, ... T    F    F    F    F
    0.00000009, ... T    F    F    F    T
    0.30000000, ... T    F    F    T    F
    0.45210000, ... T    F    F    T    T
    0.00000050, ... T    F    T    F    F
    0.45230000, ... T    F    T    F    T
    0.41000000, ... T    F    T    T    F
    0.77000000, ... T    F    T    T    T
    0.20000000, ... T    T    F    F    F
    0.36000000, ... T    T    F    F    T
    0.32000000, ... T    T    F    T    F
    0.86065000, ... T    T    F    T    T
    0.08000000, ... T    T    T    F    F
    0.55230000, ... T    T    T    F    T
    0.56000000, ... T    T    T    T    F
    0.84000000);  % T    T    T    T    T

f12.AddAllParents(f04, f09, ...
    0.00000001, ... F    F
    0.50000000, ... F    T
    0.50000000, ... T    F
    0.80000000);  % T    T

% Set incident nodes.
e01.AddAllParents(f10, ...
    0.00000003, ... F
    0.49999999);  % T

e02.AddAllParents(f10, ...
    0.00000003, ... F
    0.49999999);  % T

e03.AddAllParents(f11, ...
    0.00000003, ... F
    0.86660000);  % T

e04.AddAllParents(f12, ...
    0.00000001, ... F
    0.67700000);  % T

e05.AddAllParents(e01, ...
    0.00000001, ... F
    0.25650000);  % T

e06.AddAllParents(e04, ...
    0.00000001, ... F
    0.25650000);  % T

e07.AddAllParents(e02, ...
    0.00000001, ... F
    0.55650000);  % T

e08.AddAllParents(f06, ...
    0.00000002, ... F
    0.90000000);  % T 

% Set asset nodes.
x01.AddAllParents(e03, e04, e06, e07, e08, ...
    0.00000000, ... F    F    F    F    F
    0.60000000, ... F    F    F    F    T
    0.30000000, ... F    F    F    T    F
    0.65000000, ... F    F    F    T    T
    0.99999999, ... F    F    T    F    F
    0.99999999, ... F    F    T    F    T
    0.99999999, ... F    F    T    T    F
    0.99999999, ... F    F    T    T    T
    0.30000000, ... F    T    F    F    F
    0.65000000, ... F    T    F    F    T
    0.40000000, ... F    T    F    T    F
    0.70000000, ... F    T    F    T    T
    0.99999999, ... F    T    T    F    F
    0.99999999, ... F    T    T    F    T
    0.99999999, ... F    T    T    T    F
    0.99999999, ... F    T    T    T    T
    0.30000000, ... T    F    F    F    F
    0.65000000, ... T    F    F    F    T
    0.40000000, ... T    F    F    T    F
    0.70000000, ... T    F    F    T    T
    0.99999999, ... T    F    T    F    F
    0.99999999, ... T    F    T    F    T
    0.99999999, ... T    F    T    T    F
    0.99999999, ... T    F    T    T    T
    0.50000000, ... T    T    F    F    F
    0.60000000, ... T    T    F    F    T
    0.55000000, ... T    T    F    T    F
    0.80000000, ... T    T    F    T    T
    0.99999999, ... T    T    T    F    F
    0.99999999, ... T    T    T    F    T
    0.99999999, ... T    T    T    T    F
    0.99999999);  % T    T    T    T    T

x02.AddAllParents(e04, e06, ...
    0.00000000, ... F    F
    0.99990000, ... F    T
    0.50000000, ... T    F
    0.99990000);  % T    T

x03.AddAllParents(e05, e06, ...
    0.00000000, ... F    F
    0.90000000, ... F    T
    0.60000000, ... T    F
    0.98000000);  % T    T

x04.AddAllParents(e06, ...
    0.00000003, ... F
    0.95000000);  % T

x05.AddAllParents(e06, ...
    0.00000003, ... F
    0.80000000);  % T

x06.AddAllParents(e06, e07, ...
    0.00000000, ... F    F
    0.60000000, ... F    T
    0.90000000, ... T    F
    0.90000000);  % T    T

x07.AddAllParents(e06, e07, ...
    0.00000000, ... F    F
    0.80000000, ... F    T
    0.90000000, ... T    F
    0.90000000);  % T    T

x08.AddAllParents(e06, ...
    0.00000003, ... F
    0.90000000);  % T 

%% Create the Bayesian network.
BayesianNetwork = Classes.BayesianNetwork();

%% Add the nodes into the Bayesian network.
BayesianNetwork.AddNodes(... Add attack nodes.
                         a01, a02, a03, a04, a05, a06, a07, a08, a09, a10, ...
                         a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, ...
                         a21, a22, a23, a24, a25, a26, a27, ...
                         ... Add resource nodes.
                         r01, r02, r03, r04, r05, r06, r07, r08, r09, ...
                         ... Add function nodes.
                         f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, ...
                         f11, f12, ...
                         ... Add incident nodes.
                         e01, e02, e03, e04, e05, e06, e07, e08, ...
                         ... Add asset nodes.
                         x01, x02, x03, x04, x05, x06, x07, x08);

%% Initialize the Bayesian network.
BayesianNetwork.Initialize();

%% Add the evidences into the Bayesian network.
% BayesianNetwork.AddEvidences(f05, f04, f06);

BayesianNetwork.Inference();

%% Process test
p01 = Classes.Process('p01');
p02 = Classes.Process('p02');
p03 = Classes.Process('p03');
p04 = Classes.Process('p04');
p05 = Classes.Process('p05');
p06 = Classes.Process('p06');
p07 = Classes.Process('p07');

p01.AddAllParents(f01, ...
    0,          ... F
    1);           % T

p02.AddAllParents(f02, ...
    0,          ... F
    1);           % T

p03.AddAllParents(f03, ...
    0,          ... F
    1);           % T

p04.AddAllParents(f04, ...
    0,          ... F
    1);           % T

p05.AddAllParents(f05, ...
    0,          ... F
    1);           % T

p06.AddAllParents(f06, ...
    0,          ... F
    1);           % T

p07.AddAllParents(f07, ...
    0,          ... F
    1);           % T

s01 = Classes.Product('s01', 100);
s02 = Classes.Product('s02', 100);
s03 = Classes.Product('s03', 100);
s04 = Classes.Product('s04', 100);
s05 = Classes.Product('s05', 100);
s06 = Classes.Product('s06', 100);
s07 = Classes.Product('s07', 100);

p01.AddOutputs(s01);
p02.AddOutputs(s02);
p03.AddOutputs(s03);
p04.AddOutputs(s04);
p05.AddOutputs(s05);
p06.AddOutputs(s06);
p07.AddOutputs(s07);

p02.AddInputs(s01);
p03.AddInputs(s01);
p04.AddInputs(s02);
p05.AddInputs(s03);
p06.AddInputs(s03);
p07.AddInputs(s04, s05);

ProductionModel = Classes.ProductionModel();
ProductionModel.AddProcesses(p01, p02, p03, p04, p05, p06, p07);
ProductionModel.Initialize();

disp(ProductionModel.IncidenceMatrix);
