% avoid adding all the git directories to the path just by doing it
% manually for now ...
addpath('./algorithms');
addpath('./algorithms/test');
addpath('./algorithms/mex');

addpath('./bn');
addpath('./bn/test');

addpath('./data');
addpath('./data/test');

addpath('./misc');

addpath('./optim');

addpath('./simulations');
addpath('./simulations/betakernel');
addpath('./simulations/cos');
addpath('./simulations/hcbn');
addpath('./simulations/misc');
addpath('./simulations/independence');

addpath('./testfiles');

addpath('../minepy/matlab');

addpath('./python');

% setup Python in Matlab if it isn't already loaded
try
    pyversion 2.7   % assume you have Python 2.7 :D
catch
end

% add the python folder to the PYTHON search path
if count(py.sys.path,'./python') == 0
    insert(py.sys.path,int32(0),'./python');
end

% python module dependencies check
requiredModules = {'numpy', 'matplotlib', 'scipy', 'sklearn', 'cvxopt'};
for ii=1:length(requiredModules)
    modName = requiredModules{ii};
    try
        py.importlib.import_module(modName);
    catch ME
        if (strcmp(ME.identifier,'MATLAB:Python:PyException'))
            warning('Python Error! module: %s required for python extension modules!', modName);
        end
    end
end