%% This Function reads an .xlsx file and makes the first row as a varible name for each column.
%% Varible Name might be changed to be valid in Matlab.
%% It saves the work space as a file so that the values can be used later.

%% API Example : rdXls2Matl('test.xlsx','test.mat')
%% Use the workspace vaule by loading the mat , (clicking the file or load('test.mat'))

function rdXls2Matl(xlsFileName,wsName)
    [val nms] = xlsread( xlsFileName );
    %%
    for i = 1:length(nms)
        nm = nms{i};
        validName = matlab.lang.makeValidName(nm);
        str_var = validName;

        tmp_str = strcat('= val(:,',num2str(i));
        tmp_str = strcat(tmp_str, ')')

        eval( [str_var, tmp_str]);
    end
save(wsName)
end
