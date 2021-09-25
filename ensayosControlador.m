%% ENSAYOS DE COMPORTAMIENTOS DINAMICOS CON 20SIM PARA EL CONTROLADOR PD
% SE GRAFICAN AQUI LOS RESULTADOS DE LOS DIVERSOS ENSAYOS QUE SE REALIZARON
% PARA MANIPULADOR RR EMPLEANDO UN CONTROLADOR TIPO PD PARA FIJAR LA
% POSICION DE EFECTOR FINAL
% 
%       ENSAYOS: PD_ENSAYO_1 ... PD_ENSAYO_6
% 
% ADICIONALMENTE SE EXTRAEN LOS VALORES MAXIMOS Y MINIMOS QUE ALCANZAN CADA
% UNA DE LAS VARIABLES GRAFICADAS.


% LIMPIAMOS EL WORKSPACE
clc
clear all
close all 

printEps = true;



%% ELEGIMOS EL ENSAYO
ensayoChosen = 'PD_ensayo_1';


%% IMPORTAR LOS METADATOS DEL ENSAYO
path = sprintf('/Users/luis/Documents/MATLAB/BG/input/metadatos/%s.csv', ...
               ensayoChosen);
MetadatosEnsayo = importfileMetadatos(path, [2, Inf]);

% EXTRAEMOS LOS NOMBRES Y TIPOS DE VARIABLES EN DOS ARRAY
variableNames = MetadatosEnsayo.Variables;
variableTypes = MetadatosEnsayo.Types;


%% IMPORTAR LOS DATOS DEL ENSAYO COMO TABLA
path = sprintf('/Users/luis/Documents/MATLAB/BG/input/controlador/%s.csv', ...
               ensayoChosen);
ensayo = importfilePD(path, [2, Inf], variableNames, variableTypes);


%% AGREGAR LOS METADATOS

% AGREGAMOS LAS UNIDADES DE LAS VARIABLES DE NUESTRO ENSAYO
ensayo.Properties.VariableUnits = MetadatosEnsayo.Units;

% INGRESAMOS LAS DESCRIPCIONES DE LAS VARIABLES DE NUESTRO ENSAYO
ensayo.Properties.VariableDescriptions = MetadatosEnsayo.Descriptions;



%% IMPORTAR LOS ATRIBUTOS DE VISUALIZACION
path = sprintf('/Users/luis/Documents/MATLAB/BG/input/parametros/%s.csv', ...
               ensayoChosen);
ParametrosEnsayo = importfileParametros(path, [2, Inf]);


% CONVERTIRLOS A ESTRUCTURA Y AJUSTAR LOS TIPOS DE DATOS QUE SON DEL TIPO
% ARRAY
S = table2struct(ParametrosEnsayo);

for k=1:numel(S)
    S(k).XLimSpan = str2num(S(k).XLimSpan);
    S(k).YLimSpan = str2num(S(k).YLimSpan);
    S(k).YTick = str2num(S(k).YTick);
    S(k).XLineCoordinates = str2num(S(k).XLineCoordinates);
end


%% GRAFICAR ITERANDO

for k=1:numel(S)
    options = S(k);
    
    if k==numel(S)
        x = ensayo.Xe;
        y = ensayo.Ye;
    else
        x = ensayo.t;
        y = ensayo.(S(k).Variable);
    end
    
    
    hf = figure('Name',options.FigureName);
    ax = gca;
    hold on
    
    for j=1:length(options.XLineCoordinates)
        xline(options.XLineCoordinates(j),'-.');
    end
    
    %hLine1 = xline(0.1,'-.');
    %hLine2 = xline(0.3,'-.');

    hFig = plot(x,y);
    %grid on

    ax.XLim = options.XLimSpan;
    ax.YLim = options.YLimSpan;
    ax.YTick = options.YTick;
    
    % FIGURA
    hFig.LineWidth = options.LineWidth;
    hFig.Color = options.LineColor;
    
    % LABELS EJES
    hXLabel = xlabel(options.XLabelText);
    hYLabel = ylabel(options.YLabelText,'Interpreter',options.Interpreter);
    
    hLegend = legend(hFig,options.LegendText);
    set(hLegend,'Location',options.LegendLocation);
    
        % Ajust font
    set(gca, 'FontName', 'Helvetica');
    set([hLegend, gca], 'FontSize', 10);
    set([hXLabel, hYLabel], 'FontSize', 12);
    
    grid on
    
    set(gca, 'XLim', options.XLimSpan);
    set(gca, 'YLim', options.YLimSpan);
    
    %['images/' options.Ensayo '/' options.FigureName]
    path = sprintf('images/%s',options.FigureName);
    
    % IMPRIMIR IMAGEN A .EPS
    if printEps
        print(path, '-depsc');
    end
end


%% SACAR UN SUMARIO DE LOS DATOS PARA ANALISIS POSTERIOR
%close all
s = summary(ensayo);

% REMOVEMOS LA VARIABLE TIEMPO YA QUE NO ES NECESARIA PARA NUESTRO ANALISIS
s = rmfield(s,'t');

% CREAMOS UNA LISTA DE LOS CAMPOS A EXPORTAR E ITERAMOS PARA ESTRUCTURARLOS
% ADECUADAMENTE PARA LA EXPORTACION
fieldsVars = fields(s);

for k=1:numel(fieldsVars)
    sub = s.(fieldsVars{k});
    
    X(k,1).Description = sub.Description;
    X(k,1).Min = sub.Min;
    X(k,1).Max = sub.Max;
    X(k,1).Units = sub.Units;
end

% CONVERTIMOS NUESTRA EXTRUCTURA EN UNA TABLA Y LA EXPORTAMOS PARA
% PRESERVARLA PARA POSTERIOR ANALISIS.
T = struct2table(X);

path = sprintf('/Users/luis/Documents/MATLAB/BG/output/summary/%s.csv', ...
               ensayoChosen);
writetable(T,path);

