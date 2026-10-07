%%
% GUI Diffusion coefficient
% - function to evaluate concentration profiles of Cu-Ni in order to
%   calculate concentration dependent diffusion coefficients using
%   Sauer-Freise-den Broeder method

% componets of program

% - importing data in format:
%       column 1 - index
%       column 2 - e.g. position    [µm]
%       column 3 - concentration    [%]
%       column 4 - concentration    [%]
% - additional information required:
%       unit of concentrations - at or wt
%       step size of line scan      [µm]
%       time                        [s]

% - calclulation of diffsion components
%   option 1: analytical
%           fitting Five-parameter logistic function to data which is used
%           for calculating diffusion coefficients
%   option 2: numerical
%           diffusion coeffcients are calculated purely numerically from
%           experimental data

% - plotting and exporting all relevant graphs

% - exporting data to excel files in small or extended format saving data
%   from calculation options in separate excel sheets
%           option 1: to excel sheet 1
%           option 2: to excel sheet 2

% Becker, H. (2016): Diffusion_coefficient 

function varargout = Diffusion_coefficient(varargin)
%DIFFUSION_COEFFICIENT M-file for Diffusion_coefficient.fig
%      DIFFUSION_COEFFICIENT, by itself, creates a new DIFFUSION_COEFFICIENT or raises the existing
%      singleton*.
%
%      H = DIFFUSION_COEFFICIENT returns the handle to a new DIFFUSION_COEFFICIENT or the handle to
%      the existing singleton*.
%
%      DIFFUSION_COEFFICIENT('Property','Value',...) creates a new DIFFUSION_COEFFICIENT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Diffusion_coefficient_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      DIFFUSION_COEFFICIENT('CALLBACK') and DIFFUSION_COEFFICIENT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in DIFFUSION_COEFFICIENT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Diffusion_coefficient

% Last Modified by GUIDE v2.5 18-Apr-2016 20:49:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Diffusion_coefficient_OpeningFcn, ...
                   'gui_OutputFcn',  @Diffusion_coefficient_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Diffusion_coefficient is made visible.
function Diffusion_coefficient_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Diffusion_coefficient
handles.output = hObject;
set(handles.time,'String',10800); 
set(handles.sz,'String',0.5);
handles.val = 1;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Diffusion_coefficient wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Diffusion_coefficient_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sz_Callback(hObject, eventdata, handles)
% hObject    handle to sz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sz as text
%        str2double(get(hObject,'String')) returns contents of sz as a double


% --- Executes during object creation, after setting all properties.
function sz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in unit.
function unit_Callback(hObject, eventdata, handles)
% hObject    handle to unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit

handles.val = get(hObject,'Value');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[File,Path] = uigetfile('D:/*.txt','Open File.');
data=importdata([Path,File]);
element = char(data.textdata(1,3));
tf = strcmp(element,'*Ni');
if tf == 0
c1(:,1) = data.data(:,4); 
c2(:,1) = data.data(:,3); 
else
c1(:,1) = data.data(:,3); 
c2(:,1) = data.data(:,4); 
end

sz = str2num(get(handles.sz,'String'));
   % create position matrix
   msz = size(c1(:,1));                % number of data points
   dd(:,1) = (0:sz:sz*(msz-1));
   % normalize to at%
   if handles.val == 2
       cCuat = c1./63.546/(c1./63.546+c2./58.693)*100;
       cNiat = c2./58.693/(c1./63.546+c2./58.693)*100;       
   else
       cCuat = c1;
       cNiat = c2;      
   end
   handles.Path = Path;
   handles.File = File;
   handles.cCuat = cCuat;
   handles.cNiat = cNiat;
   handles.dd = dd;
   guidata(hObject, handles);
         
% --- Executes on button press in Rawdata.
function Rawdata_Callback(hObject, eventdata, handles)
% hObject    handle to Rawdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)         
% --- Executes on button press in calculate.
            dd = handles.dd;
            sz = size(dd); 
            dsz = str2num(get(handles.sz,'String'));
            dd(:,1) = (0:dsz:dsz*(sz-1));
            cCuat = handles.cCuat;
            cNiat = handles.cNiat;
figure
        hold on;
        box on;
        set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
        title('Concentration profiles');
        xlabel('Position [µm]');
        ylabel('Concentration [at%]');
        plot(dd,cCuat,'b-','Linewidth',2);        
        plot(dd,cNiat,'r-','Linewidth',2);
         k{1} = ['Cu-exp'];
         k{2} = ['Ni-exp'];
         legend(k,'Location','East','Linewidth',2,'Fontsize',12,'FontWeight','Demi') 


function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

            dd = handles.dd;
            sz = size(dd); 
            dsz = str2num(get(handles.sz,'String'));
            dd(:,1) = (0:dsz:dsz*(sz-1));
            t = str2num(get(handles.time,'String'));
            c_Cu_h = handles.cCuat;
            c_Ni_h = handles.cNiat;
            if c_Cu_h(1,1)>max(c_Cu_h(:,1))/2
                c_Cu(:,1) = flipud(c_Cu_h(:,1));   % Cu concentration
                c_Ni(:,1) = 100 - flipud(c_Ni_h(:,1));
                v = 1;
            else
                c_Cu(:,1) = 100 - flipud(c_Cu_h(:,1));
                c_Ni(:,1) = flipud(c_Ni_h(:,1));   % Ni concentration   
                v = 2;
            end

%% fitting and normalizing data

% fits a Five-parameter logistic function (5PL) and displays the 5 fit
% parameters and fit parameters
    % The 5PL equation is:
    % F(x) = D+(A-D)/((1+(x/C)^B)^E)
    % where:
        % A = Minimum asymptote. In a bioassay where you have a standard curve,
        % this can be thought of as the response value at 0 standard concentration.
        %
        % B = Hill's slope. The Hill's slope refers to the steepness of the curve.
        % It could either be positive or negative.
        %
        % C = Inflection point. The inflection point is defined as the point on the
        % curve where the curvature changes direction or signs. C is the
        % concentration of analyse where y=(D-A)/2.
        %
        % D = Maximum asymptote. In an bioassay where you have a standard curve,
        % this can be thought of as the response value for infinite standard
        % concentration. 
        % 
        % E = Asymmetry factor. When E=1 we have a symmetrical curve around
        % inflection point and so we have a four-parameters logistic equation.
        
        % set fit range
            l_Cu = 1;
            r_Cu = sz-0;
            l_Ni = 1;
            r_Ni = sz-0;
            
[cf G] = L5P(dd(l_Cu:r_Cu),c_Cu(l_Cu:r_Cu))
        % save the five parameters from the fit
        MSE = sum((c_Cu(l_Cu:r_Cu)-F_L5P(cf,dd(l_Cu:r_Cu))).^2)/length(dd(l_Cu:r_Cu)-5);
        fit_Cu(1,:) = cf;
        q_Cu(:,1) = MSE;
        clear cf rsquare MSE
[cf G] = L5P(dd(l_Ni:r_Ni,1),c_Ni(l_Ni:r_Ni,1));
        % save the five parameters from the fit
        MSE = sum((c_Ni(l_Ni:r_Ni)-F_L5P(cf,dd(l_Ni:r_Ni))).^2)/length(dd(l_Ni:r_Ni)-5);       
        fit_Ni(1,:) = cf;       
        q_Ni(:,1) = MSE;
        clear cf rsquare MSE

        % normalization of concentration data and fit data
        cn_Cu(:,1) = (c_Cu(:,1)-fit_Cu(1,1))./(fit_Cu(1,4)-fit_Cu(1,1))*100;
        cn_Ni(:,1) = (c_Ni(:,1)-fit_Ni(1,1))./(fit_Ni(1,4)-fit_Ni(1,1))*100;
        
        % repitition of Five-parameter logistic function (5PL) fits to normalized data 
clear fit_Cu(1,:) q_Cu(:,1) fit_Ni(1,:) q_Ni(:,1)
[cf G] = L5P(dd(l_Cu:r_Cu,1),cn_Cu(l_Cu:r_Cu,1));
        % save the five parameters from the fit
        MSE = sum((cn_Cu(l_Cu:r_Cu)-F_L5P(cf,dd(l_Cu:r_Cu))).^2)/length(dd(l_Cu:r_Cu)-5);
        fit_Cu(1,:) = cf;
        q_Cu(:,1) = MSE;
        fit_Cu(1,1) = round(fit_Cu(1,1));
        fit_Cu(1,4) = round(fit_Cu(1,4));
        clear cf rsquare MSE
[cf G] = L5P(dd(l_Ni:r_Ni,1),cn_Ni(l_Ni:r_Ni,1));
        % save the five parameters from the fit
        MSE = sum((cn_Ni(l_Ni:r_Ni)-F_L5P(cf,dd(l_Ni:r_Ni))).^2)/length(dd(l_Ni:r_Ni)-5);     
        fit_Ni(1,:) = cf;       
        q_Ni(:,1) = MSE;   
        fit_Ni(1,1) = round(fit_Ni(1,1));
        fit_Ni(1,4) = round(fit_Ni(1,4));  
        clear cf rsquare MSE
        
        %% preconsiderations for calculation of concentration dependent diffusion coefficient
% concentration dependent diffusion coefficient
% by Sauer-Freise-den Broeder method
% D(c') = 1/(2t*((dC/dx),[x'])) *((1-c')*(int(c')dx,[x',inf])+c'*(int(c')dx,[-inf,x']))
% D(c') = 1/(2t*((dC/dx),[x'])) *((1-c')*I(A)                +c'*(I(D)+(I)E)))

% preconsiderations: 
%   - appropriate step size
%   - first derivative      (dC/dx),[x'])
%   - integral              I(A) = int(c')dx,[x',inf] and I(D+E) = int(c')dx,[-inf,x']
%     of Five-parameter logistic function (5PL)

%% appropriate step size
% according to Kailasam approx. 50 data points should be contained in the
% specified concentration range (e.g. 10 to 90%) to achieve best possible accurateness in
% numerical determination of integral, therefore step size of position x is decreased
    szn =50;
    % find position x with concentration 10 and 90% 
    cs_Cu = 10;
    xs_Cu = fit_Cu(1,3)*(((fit_Cu(1,1)-fit_Cu(1,4))/(cs_Cu-fit_Cu(1,4)))^(1/fit_Cu(1,5))-1)^(1/fit_Cu(1,2));
    ce_Cu = 90;
    xe_Cu = fit_Cu(1,3)*(((fit_Cu(1,1)-fit_Cu(1,4))/(ce_Cu-fit_Cu(1,4)))^(1/fit_Cu(1,5))-1)^(1/fit_Cu(1,2));
    sz_Cu = abs(xe_Cu-xs_Cu)/szn;
dd_Cu(:,1) = (0:sz_Cu:dsz(1)*(sz-1));
    % new length
    s_Cu = size(dd_Cu(:,1));

    cs_Ni = 10;
    xs_Ni = fit_Ni(1,3)*(((fit_Ni(1,1)-fit_Ni(1,4))/(cs_Ni-fit_Ni(1,4)))^(1/fit_Ni(1,5))-1)^(1/fit_Ni(1,2));
    ce_Ni = 90;
    xe_Ni = fit_Ni(1,3)*(((fit_Ni(1,1)-fit_Ni(1,4))/(ce_Ni-fit_Ni(1,4)))^(1/fit_Ni(1,5))-1)^(1/fit_Ni(1,2));
    sz_Ni = abs(xe_Ni-xs_Ni)/szn;
dd_Ni(:,1) = (0:sz_Ni:dsz(1)*(sz-1));
    % new length
    s_Ni = size(dd_Ni(:,1));
    
    % calculates normalized concentration data from fit with adjusted step size
    %yna_Cu(:,1) = -1*(-100+fit_Cu(1,4) + (fit_Cu(1,1)-fit_Cu(1,4))./((1+(dd_Cu(:,1)/fit_Cu(1,3)).^fit_Cu(1,2)).^fit_Cu(1,5)));
    yna_Cu(:,1) = fit_Cu(1,4) + (fit_Cu(1,1)-fit_Cu(1,4))./((1+(dd_Cu(:,1)/fit_Cu(1,3)).^fit_Cu(1,2)).^fit_Cu(1,5));
    yna_Ni(:,1) = fit_Ni(1,4) + (fit_Ni(1,1)-fit_Ni(1,4))./((1+(dd_Ni(:,1)/fit_Ni(1,3)).^fit_Ni(1,2)).^fit_Ni(1,5));

%% first derivative (dC/dx),[x'])   
% first derivative of Five-parameter logistic function (5PL)
% F'(x) = (D-A)*E(1+(x/C)^(B))^(-(E+1))*B(C^(-B)x^(B-1))

% first derivative of Five-parameter logistic function (5PL) with adjusted step size
    yd1a_Cu(:,1) = abs(-(fit_Cu(1,4)-fit_Cu(1,1))...   
            .*(fit_Cu(1,5).*((1+(dd_Cu(:,1).^fit_Cu(1,2)/(fit_Cu(1,3).^fit_Cu(1,2)))).^(-fit_Cu(1,5)-1))...
            .* (fit_Cu(1,2)/(fit_Cu(1,3).^fit_Cu(1,2)).*dd_Cu(:,1).^(fit_Cu(1,2)-1))));
        fNaN_Cu = find(isnan(yd1a_Cu(:,1)));
        feNaN_Cu = isempty(fNaN_Cu);
        
    yd1a_Ni(:,1) = abs((fit_Ni(1,4)-fit_Ni(1,1))...   
            .*(fit_Ni(1,5).*((1+(dd_Ni(:,1).^fit_Ni(1,2)/(fit_Ni(1,3).^fit_Ni(1,2)))).^(-fit_Ni(1,5)-1))...
            .* (fit_Ni(1,2)/(fit_Ni(1,3).^fit_Ni(1,2)).*dd_Ni(:,1).^(fit_Ni(1,2)-1)))); 
        fNaN_Ni = find(isnan(yd1a_Ni(:,1)));
        feNaN_Ni = isempty(fNaN_Ni);
% in case analytical calclation because of limited calculability, 
% if B of LP5 is to huge, derivative is calculated numerically
    if feNaN_Ni == 0
        clear yd1a_Ni
        yd1a_Ni(:,1) = zeros(s_Ni(1),1:1);
        for i = 2:s_Ni-1
            yd1a_Ni(i,1) = abs((yna_Ni(i+1,1)-yna_Ni(i-1,1))/(2*sz_Ni));
        end
    elseif feNaN_Cu == 0
        clear yd1a_Cu
        yd1a_Cu = zeros(s_Cu(1),1);
        for i = 2:s_Cu-1
            yd1a_Cu(i,1) = abs((yna_Cu(i+1,1)-yna_Cu(i-1,1))/(2*sz_Cu));
        end        
    else
    end
    clear fNaN_Ni fNaN_Cu feNaN_Ni feNaN_Cu i
   
    axes(handles.profile)
    cla(handles.profile,'reset') 
                hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('Concentration profiles');
                xlabel('Position x [µm]');
                ylabel('Normalized concentration c_n [%]');
                axis([0 inf -inf 160])
                %plot(dd(:,1),100-cn_Cu(:,1),'b-','Linewidth',2);   
                plot(dd(:,1),cn_Cu(:,1),'b-','Linewidth',2);  
                plot(dd_Cu(:,1),yna_Cu(:,1),'c-','Linewidth',2);
                plot(dd_Cu(:,1),yd1a_Cu(:,1),'c:','Linewidth',2);
                plot(dd(:,1),100-cn_Ni(:,1),'r-','Linewidth',2);
                plot(dd_Ni(:,1),100-yna_Ni(:,1),'m-','Linewidth',2);
                plot(dd_Ni(:,1),-yd1a_Ni(:,1),'m:','Linewidth',2);
                plot(dd,10,'k-','Linewidth',1)
                plot(dd,90,'k-','Linewidth',1)
                    clear k
                    k{1} = ['c_C_u_-_e_x_p'];
                    k{2} = ['c_C_u_-_f_i_t (MSE = ',num2str(q_Cu(:,1),4),')'];
                    k{3} = ['d(c_C_u)/dx'];
                    k{4} = ['c_N_i_-_e_x_p'];
                    k{5} = ['c_N_i_-_f_i_t (MSE = ',num2str(q_Ni(:,1)),')'];
                    k{6} = ['d(c_N_i)/dx'];
                    legend(k,'Location','North','Linewidth',2,'Fontsize',10,'FontWeight','Demi')
                    
%% integral I(A) = int(c')dx,[x',inf] and I(D+E) = int(c')dx,[-inf,x']
% calculation of definite integral of Five-parameter logistic function (5PL)
% --> analytical solution not possible
% --> numerical solution using matlab function integral with global
%     adaptive quadrature and absolute error tolerance of 1e-12        
% calculate integral I(A) and I(E+D) with adjusted step size

% I(A)
for i = 1:s_Cu
    fun = @(dd_Cu)fit_Cu(1,4) + (fit_Cu(1,1)-fit_Cu(1,4))./((1+(dd_Cu/fit_Cu(1,3)).^fit_Cu(1,2)).^fit_Cu(1,5));
        IAa_Cu(i,1) = integral(fun,0,dd_Cu(i,1));%,'RelTol',0,'AbsTol',1e-12);
end     
% I(E+D)
for i = 1:s_Ni
    fun = @(dd_Ni)fit_Ni(1,4) + (fit_Ni(1,1)-fit_Ni(1,4))./((1+(dd_Ni/fit_Ni(1,3)).^fit_Ni(1,2)).^fit_Ni(1,5));
        IAa_Ni(i,1) = integral(fun,0,dd_Ni(i,1));%,'RelTol',0,'AbsTol',1e-12);
end
IEDa_Cu(:,1) = abs(((dd_Cu(end,1)-dd_Cu(:,1))*100-((IAa_Cu(end,1)-IAa_Cu(:,1)))));
IAa_Cu(:,1) = abs(IAa_Cu(:,1));
IEDa_Ni(:,1) = abs(((dd_Ni(end,1)-dd_Ni(:,1))*100-((IAa_Ni(end,1)-IAa_Ni(:,1)))));
IAa_Ni(:,1) = abs(IAa_Ni(:,1));

%% calculation of concentration dependent diffusion coefficient in concentration range between 10% and 90%
                
% calculation of concentration dependent diffusion coefficient for Ni
% between 10 and 90%
for i = 1:s_Ni
    D_Ni(i,1) = 1./(2*t.*yd1a_Ni(i,1))...
                *(IAa_Ni(i,1)*(100-yna_Ni(i,1))...
                +IEDa_Ni(i,1)*yna_Ni(i,1))/100*10^-12;     
end

   
% calculation of concentration dependent diffusion coefficient for Cu
% between 10 and 90%
for i = 1:s_Cu
    D_Cu(i,1) = 1./(2*t.*yd1a_Cu(i,1))...
                *(IAa_Cu(i,1)*(100-yna_Cu(i,1))...
                +IEDa_Cu(i,1)*yna_Cu(i,1))/100*10^-12;     
end

% plotting diffusion coefficient
                    % define boundary for plotting
                    b10_Ni = find(yna_Ni(:,1)>10);
                    b90_Ni = find(yna_Ni(:,1)>90);
                    b10_Cu = find(yna_Cu(:,1)>10);
                    b90_Cu = find(yna_Cu(:,1)>90);

            axes(handles.Diffcoef)
            cla(handles.Diffcoef,'reset')            
            hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('D(c)');
                xlabel('c_C_u [%]');
                ylabel('D [m^2/s] ');
                if v == 1
                    plot(yna_Cu(b10_Cu(1):b90_Cu(1),1),D_Cu(b10_Cu(1):b90_Cu(1),1),'c-','Linewidth',3);         
                    plot(yna_Ni(b10_Ni(1):b90_Ni(1),1),D_Ni(b10_Ni(1):b90_Ni(1),1),'m--','Linewidth',2);   
                else
                    plot(flipud(yna_Cu(b10_Cu(1):b90_Cu(1),1)),D_Cu(b10_Cu(1):b90_Cu(1),1),'c-','Linewidth',3);         
                    plot(flipud(yna_Ni(b10_Ni(1):b90_Ni(1),1)),D_Ni(b10_Ni(1):b90_Ni(1),1),'m--','Linewidth',2);   
                end
                clear k
                k{1} = ['D_C_u'];
                k{2} = ['D_N_i'];
                legend(k,'Location','SouthEast','Linewidth',2,'Fontsize',10,'FontWeight','Demi')

% actualize static text with 5-LP parameters
fitstr_Cu = num2str(fit_Cu');
set(handles.text8,'String',fitstr_Cu);
fitstr_Ni = num2str(fit_Ni');
set(handles.text9,'String',fitstr_Ni);
                
            handles.cn_Cu = cn_Cu;
            handles.cn_Ni = cn_Ni;
            handles.yna_Cu = yna_Cu;
            handles.yna_Ni = yna_Ni;
            handles.yd1a_Cu = yd1a_Cu;
            handles.yd1a_Ni = yd1a_Ni;
            handles.q_Cu = q_Cu;
            handles.q_Ni = q_Ni;
            handles.dd_Cu = dd_Cu;
            handles.dd_Ni = dd_Ni;
            handles.IAa_Cu = IAa_Cu; 
            handles.IAa_Ni = IAa_Ni;
            handles.IEDa_Cu = IEDa_Cu;
            handles.IEDa_Ni = IEDa_Ni;
            handles.D_Cu = D_Cu;
            handles.D_Ni = D_Ni;
            handles.b10_Ni = b10_Ni(1);
            handles.b90_Ni = b90_Ni(1);
            handles.b10_Cu = b10_Cu(1);
            handles.b90_Cu = b90_Cu(1);
            handles.v = v;
            handles.fit_Cu = fit_Cu;
            handles.fit_Ni = fit_Ni;
            handles.q_Cu = q_Cu;
            handles.q_Ni = q_Ni;
            handles.dd_Cu = dd_Cu;
            handles.dd_Ni = dd_Ni;
            handles.m = 1;
            guidata(hObject, handles);
               




% --- Executes on button press in Calculate_numerical.
function Calculate_numerical_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_numerical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
            dd = handles.dd;
            sz = size(dd); 
            dsz = str2num(get(handles.sz,'String'));
            dd(:,1) = (0:dsz:dsz*(sz-1));
            t = str2num(get(handles.time,'String'));
            c_Cu_h = handles.cCuat;
            c_Ni_h = handles.cNiat;
            if c_Cu_h(1,1)>max(c_Cu_h(:,1))/2
                c_Cu(:,1) = flipud(c_Cu_h(:,1));   % Cu concentration
                c_Ni(:,1) = 100 - flipud(c_Ni_h(:,1));
                v = 1;
            else
                c_Cu(:,1) = 100 - flipud(c_Cu_h(:,1));
                c_Ni(:,1) = flipud(c_Ni_h(:,1));   % Ni concentration   
                v = 2;
            end

% numerical integral
IAa_Cu(1,1) = 0;
IAa_Ni(1,1) = 0;
for i = 2:sz-1
    a1 = (c_Cu(i+1,1)-c_Cu(i,1))/(dd(i+1,1)-dd(i,1));
    a2 = (c_Cu(i,1)-c_Cu(i-1,1))/(dd(i,1)-dd(i-1,1));
           IAa_Cu(i,1) = (IAa_Cu(i-1,1)+...
               1/2*((1/2*a1*dd(i+1,1)^2+dd(i+1,1)*(c_Cu(i,1)-(dd(i,1)*a1)))-...
               (1/2*a1*dd(i,1)^2+dd(i,1)*(c_Cu(i,1)-(dd(i,1)*a1)))+...
               (1/2*a2*dd(i,1)^2+dd(i,1)*(c_Cu(i,1)-(dd(i,1)*a2)))-...
               (1/2*a2*dd(i-1,1)^2+dd(i-1,1)*(c_Cu(i,1)-(dd(i,1)*a2)))));
    b1 = (c_Ni(i+1,1)-c_Ni(i,1))/(dd(i+1,1)-dd(i,1));
    b2 = (c_Ni(i,1)-c_Ni(i-1,1))/(dd(i,1)-dd(i-1,1));
           IAa_Ni(i,1) = (IAa_Ni(i-1,1)+...
               1/2*((1/2*b1*dd(i+1,1)^2+dd(i+1,1)*(c_Ni(i,1)-(dd(i,1)*b1)))-...
               (1/2*b1*dd(i,1)^2+dd(i,1)*(c_Ni(i,1)-(dd(i,1)*b1)))+...
               (1/2*b2*dd(i,1)^2+dd(i,1)*(c_Ni(i,1)-(dd(i,1)*b2)))-...
               (1/2*b2*dd(i-1,1)^2+dd(i-1,1)*(c_Ni(i,1)-(dd(i,1)*b2)))));
end

IEDa_Cu(:,1) = abs(((dd(end-1,1)-dd(1:end-1,1))*100-((IAa_Cu(end,1)-IAa_Cu(:,1)))));
IAa_Cu(:,1) = abs(IAa_Cu(:,1));
IEDa_Ni(:,1) = abs(((dd(end-1,1)-dd(1:end-1,1))*100-((IAa_Ni(end,1)-IAa_Ni(:,1)))));
IAa_Ni(:,1) = abs(IAa_Ni(:,1));

% numerical derivative 
        yd1a_Ni(:,1) = zeros(sz,1);
        yd1a_Cu(:,1) = zeros(sz,1);        
        for i = 3:sz-2
            yd1a_Ni(i,1) = abs((-c_Ni(i+2,1)+8*c_Ni(i+1,1)-8*c_Ni(i-1,1)+c_Ni(i-2,1))/(12*dsz));
            yd1a_Cu(i,1) = abs((-c_Cu(i+2,1)+8*c_Cu(i+1,1)-8*c_Cu(i-1,1)+c_Cu(i-2,1))/(12*dsz));
        end


%% calculation of concentration dependent diffusion coefficient in concentration range between 10% and 90%
                
% calculation of concentration dependent diffusion coefficient for Ni
% between 10 and 90%
        D_Ni(:,1) = zeros(sz,1);
for i = 2:sz-1
    D_Ni(i,1) = 1./(2*t.*yd1a_Ni(i,1))...
                *(IAa_Ni(i,1)*(100-c_Ni(i,1))...
                +IEDa_Ni(i,1)*c_Ni(i,1))/100*10^-12;     
end

   
% calculation of concentration dependent diffusion coefficient for Cu
% between 10 and 90%
D_Cu(:,1) = zeros(sz,1);
for i = 2:sz-1
    D_Cu(i,1) = 1./(2*t.*yd1a_Cu(i,1))...
                *(IAa_Cu(i,1)*(100-c_Cu(i,1))...
                +IEDa_Cu(i,1)*c_Cu(i,1))/100*10^-12;     
end

    axes(handles.profile)
    cla(handles.profile,'reset') 
                hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('Concentration profiles');
                xlabel('Position x [µm]');
                ylabel('Normalized concentration c_n [%]');
                axis([0 inf -inf 160])
                %plot(dd(:,1),100-cn_Cu(:,1),'b-','Linewidth',2);   
                plot(dd(:,1),c_Cu(:,1),'b-','Linewidth',2);  
                plot(dd(:,1),yd1a_Cu(:,1),'c:','Linewidth',2);
                plot(dd(:,1),100-c_Ni(:,1),'r-','Linewidth',2);
                plot(dd(:,1),-yd1a_Ni(:,1),'m:','Linewidth',2);
                plot(dd,10,'k-','Linewidth',1)
                plot(dd,90,'k-','Linewidth',1)
                    clear k
                    k{1} = ['c_C_u_-_e_x_p'];
                    k{2} = ['d(c_C_u)/dx'];
                    k{3} = ['c_N_i_-_e_x_p'];
                    k{4} = ['d(c_N_i)/dx'];
                    legend(k,'Location','North','Linewidth',2,'Fontsize',10,'FontWeight','Demi')
                    
                    % plotting diffusion coefficient
                    % define boundary for plotting
                    b10_Ni = find(c_Ni(:,1)>10);
                    b90_Ni = find(c_Ni(:,1)>90);
                    b10_Cu = find(c_Cu(:,1)>10);
                    b90_Cu = find(c_Cu(:,1)>90);
                    
    axes(handles.Diffcoef)
    cla(handles.Diffcoef,'reset')            
            hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('D(c)');
                xlabel('c_C_u [%]');
                ylabel('D [m^2/s] ');
                if v == 1
                    plot(c_Cu(b10_Cu(1):b90_Cu(1),1),D_Cu(b10_Cu(1):b90_Cu(1),1),'co','Linewidth',3);         
                    plot(c_Ni(b10_Ni(1):b90_Ni(1),1),D_Ni(b10_Ni(1):b90_Ni(1),1),'mo','Linewidth',2);   
                else
                    plot(flipud(c_Cu(b10_Cu(1):b90_Cu(1),1)),D_Cu(b10_Cu(1):b90_Cu(1),1),'co','Linewidth',3);         
                    plot(flipud(c_Ni(b10_Ni(1):b90_Ni(1),1)),D_Ni(b10_Ni(1):b90_Ni(1),1),'mo','Linewidth',2);   
                end
                clear k
                k{1} = ['D_C_u'];
                k{2} = ['D_N_i'];
                legend(k,'Location','SouthEast','Linewidth',2,'Fontsize',10,'FontWeight','Demi')

% actualize static text with 5-LP parameters
fit_Cu(1,1) = NaN;
fit_Cu(1,2) = NaN;
fit_Cu(1,3) = NaN;
fit_Cu(1,4) = NaN;
fit_Cu(1,5) = NaN;
fit_Ni = fit_Cu;
fitstr_Cu = num2str(fit_Cu');
set(handles.text8,'String',fitstr_Cu);
fitstr_Ni = num2str(fit_Ni');
set(handles.text9,'String',fitstr_Ni);

            handles.cn_Cu = c_Cu;
            handles.cn_Ni = c_Ni;
            handles.yna_Cu = NaN;
            handles.yna_Ni = NaN;
            handles.yd1a_Cu = yd1a_Cu;
            handles.yd1a_Ni = yd1a_Ni;
            handles.q_Cu = NaN;
            handles.q_Ni = NaN;
            handles.dd_Cu = dd;
            handles.dd_Ni = dd;
            handles.IAa_Cu = IAa_Cu; 
            handles.IAa_Ni = IAa_Ni;
            handles.IEDa_Cu = IEDa_Cu;
            handles.IEDa_Ni = IEDa_Ni;
            handles.D_Cu = D_Cu;
            handles.D_Ni = D_Ni;
            handles.b10_Ni = b10_Ni(1);
            handles.b90_Ni = b90_Ni(1);
            handles.b10_Cu = b10_Cu(1);
            handles.b90_Cu = b90_Cu(1);
            handles.v = v;
            handles.fit_Cu = fit_Cu;
            handles.fit_Ni = fit_Ni;
            handles.m = 2;
            guidata(hObject, handles);
                
            
%% export plots            
%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-            

% --- Executes on button press in Integral.
function Integral_Callback(hObject, eventdata, handles)
% hObject    handle to Integral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.m == 1

            figure; hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('Integral area');
                xlabel('Position x [µm]');
                ylabel('Integral area [µm*%]');
                plot(handles.dd_Cu(:,1),handles.IAa_Cu(:,1),'c-','Linewidth',2);        
                plot(handles.dd_Ni(:,1),handles.IAa_Ni(:,1),'m-','Linewidth',2);
                plot(handles.dd_Cu(:,1),handles.IEDa_Cu(:,1),'b-','Linewidth',2);        
                plot(handles.dd_Ni(:,1),handles.IEDa_Ni(:,1),'r-','Linewidth',2);
                    clear k
                    k{1} = ['I(A)_C_u'];
                    k{2} = ['I(A)_N_i'];
                    k{3} = ['I(E+D)_C_u'];
                    k{4} = ['I(E+D)_N_i'];
                    legend(k,'Location','SouthEast','Linewidth',2,'Fontsize',12,'FontWeight','Demi')
                    
else
    sz = size(handles.dd_Cu);
         figure; hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('Integral area');
                xlabel('Position x [µm]');
                ylabel('Integral area [µm*%]');
                plot(handles.dd_Cu(1:sz(1)-1,1),handles.IAa_Cu(:,1),'c-','Linewidth',2);        
                plot(handles.dd_Ni(1:sz(1)-1,1),handles.IAa_Ni(:,1),'m-','Linewidth',2);
                plot(handles.dd_Cu(1:sz(1)-1,1),handles.IEDa_Cu(:,1),'b-','Linewidth',2);        
                plot(handles.dd_Ni(1:sz(1)-1,1),handles.IEDa_Ni(:,1),'r-','Linewidth',2);
                    clear k
                    k{1} = ['I(A)_C_u'];
                    k{2} = ['I(A)_N_i'];
                    k{3} = ['I(E+D)_C_u'];
                    k{4} = ['I(E+D)_N_i'];
                    legend(k,'Location','SouthEast','Linewidth',2,'Fontsize',12,'FontWeight','Demi')

end
                    
% --- Executes on button press in Rawconcentrationprofiles.
function Rawconcentrationprofiles_Callback(hObject, eventdata, handles)
% hObject    handle to Rawconcentrationprofiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

            dd = handles.dd;
            sz = size(dd); 
            dsz = str2num(get(handles.sz,'String'));
            dd(:,1) = (0:dsz:dsz*(sz-1));

figure
        hold on;
        box on;
        set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
        title('Concentration profiles');
        xlabel('Position [µm]');
        ylabel('Concentration [at%]');
        plot(dd,handles.cCuat,'b-','Linewidth',2);        
        plot(dd,handles.cNiat,'r-','Linewidth',2);
         k{1} = ['Cu-exp'];
         k{2} = ['Ni-exp'];
         legend(k,'Location','East','Linewidth',2,'Fontsize',12,'FontWeight','Demi') 


% --- Executes on button press in Concentrationprofilesfits.
function Concentrationprofilesfits_Callback(hObject, eventdata, handles)
% hObject    handle to Concentrationprofilesfits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

            dd = handles.dd;
            sz = size(dd); 
            dsz = str2num(get(handles.sz,'String'))
            dd(:,1) = (0:dsz:dsz*(sz-1));
            dd_Cu = handles.dd_Cu;
            dd_Ni = handles.dd_Ni;
            cn_Cu = handles.cn_Cu;
            cn_Ni = handles.cn_Ni;
            yna_Cu = handles.yna_Cu;
            yna_Ni = handles.yna_Ni;
            yd1a_Cu = handles.yd1a_Cu;
            yd1a_Ni = handles.yd1a_Ni;
            q_Cu = handles.q_Cu;
            q_Ni = handles.q_Ni;
if handles.m == 1
            figure
                hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('Concentration profiles');
                xlabel('Position x [µm]');
                ylabel('Normalized concentration c_n [%]');
                axis([0 inf -inf 160])
                %plot(dd(:,1),100-cn_Cu(:,1),'b-','Linewidth',2);   
                plot(dd(:,1),handles.cn_Cu(:,1),'b-','Linewidth',2);  
                plot(handles.dd_Cu(:,1),handles.yna_Cu(:,1),'c-','Linewidth',2);
                plot(handles.dd_Cu(:,1),handles.yd1a_Cu(:,1),'c:','Linewidth',2);
                plot(dd(:,1),100-handles.cn_Ni(:,1),'r-','Linewidth',2);
                plot(handles.dd_Ni(:,1),100-handles.yna_Ni(:,1),'m-','Linewidth',2);
                plot(handles.dd_Ni(:,1),-handles.yd1a_Ni(:,1),'m:','Linewidth',2);
                plot(dd,10,'k-','Linewidth',1)
                plot(dd,90,'k-','Linewidth',1)
                    clear k
                    k{1} = ['c_C_u_-_e_x_p'];
                    k{2} = ['c_C_u_-_f_i_t (MSE = ',num2str(handles.q_Cu(:,1),4),')'];
                    k{3} = ['d(c_C_u)/dx'];
                    k{4} = ['c_N_i_-_e_x_p'];
                    k{5} = ['c_N_i_-_f_i_t (MSE = ',num2str(handles.q_Ni(:,1)),')'];
                    k{6} = ['d(c_N_i)/dx'];
                    legend(k,'Location','North','Linewidth',2,'Fontsize',10,'FontWeight','Demi')
else
            figure
                hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('Concentration profiles');
                xlabel('Position x [µm]');
                ylabel('Normalized concentration c_n [%]');
                axis([0 inf -inf 160])
                %plot(dd(:,1),100-cn_Cu(:,1),'b-','Linewidth',2);   
                plot(handles.dd_Cu(:,1),handles.cn_Cu(:,1),'b-','Linewidth',2);  
                plot(handles.dd_Cu(:,1),handles.yd1a_Cu(:,1),'c:','Linewidth',2);
                plot(handles.dd_Ni(:,1),100-handles.cn_Ni(:,1),'r-','Linewidth',2);
                plot(handles.dd_Ni(:,1),-handles.yd1a_Ni(:,1),'m:','Linewidth',2);
                plot(handles.dd_Cu,10,'k-','Linewidth',1)
                plot(handles.dd_Cu,90,'k-','Linewidth',1)
                    clear k
                    k{1} = ['c_C_u_-_e_x_p'];
                    k{2} = ['d(c_C_u)/dx'];
                    k{3} = ['c_N_i_-_e_x_p'];
                    k{4} = ['d(c_N_i)/dx'];
                    legend(k,'Location','North','Linewidth',2,'Fontsize',10,'FontWeight','Demi')
                    
end

% --- Executes on button press in Diffusioncoefficient.
function Diffusioncoefficient_Callback(hObject, eventdata, handles)
% hObject    handle to Diffusioncoefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.m == 1; 
        figure
            hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('D(c)');
                xlabel('c_C_u [%]');
                ylabel('D [m^2/s] ');
                if handles.v == 1
                    plot(handles.yna_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),handles.D_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),'c-','Linewidth',3);         
                    plot(handles.yna_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),handles.D_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),'m--','Linewidth',2);   
                else
                    plot(flipud(handles.yna_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1)),handles.D_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),'c-','Linewidth',3);         
                    plot(flipud(handles.yna_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1)),handles.D_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),'m--','Linewidth',2);   
                end
                clear k
                k{1} = ['D_C_u'];
                k{2} = ['D_N_i'];
                legend(k,'Location','SouthEast','Linewidth',2,'Fontsize',10,'FontWeight','Demi')

else                 
     	figure
            hold on;
                box on;
                set(gca,'Linewidth',2,'Fontsize',14,'FontWeight','Demi');
                title('D(c)');
                xlabel('c_C_u [%]');
                ylabel('D [m^2/s] ');
                if handles.v == 1
                    plot(handles.cn_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),handles.D_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),'co','Linewidth',3);         
                    plot(handles.cn_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),handles.D_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),'mo','Linewidth',2);   
                else
                    plot(flipud(handles.cn_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1)),handles.D_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),'co','Linewidth',3);         
                    plot(flipud(handles.cn_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1)),handles.D_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),'mo','Linewidth',2);   
                end
                clear k
                k{1} = ['D_C_u'];
                k{2} = ['D_N_i'];
                legend(k,'Location','SouthEast','Linewidth',2,'Fontsize',10,'FontWeight','Demi')
end


%% export data            
%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-            
                
% --- Executes on button press in Export1.
function Export1_Callback(hObject, eventdata, handles)
% hObject    handle to Export1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

            Path = handles.Path;
            File = handles.File;
            dd = handles.dd;
            cCuat = handles.cCuat;
            cNiat = handles.cNiat;
            yna_Cu = handles.yna_Cu;
            yna_Ni = handles.yna_Ni;
            D_Cu = handles.D_Cu;
            D_Ni = handles.D_Ni;
            b10_Ni = handles.b10_Ni;
            b90_Ni = handles.b90_Ni;
            b10_Cu = handles.b10_Cu;
            b90_Cu = handles.b90_Cu;
            fit_Cu = handles.fit_Cu;
            fit_Ni = handles.fit_Ni;
            q_Cu = handles.q_Cu;
            q_Ni = handles.q_Ni;
            v = handles.v;
            
if handles.m == 1            
sheet = 1;
xlRange = 'A1';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'d [µm]','c(Cu) [at%]','c(Ni) [at%]','c(Chem-Cu)','D(Chem-Cu)'},sheet,xlRange)
x2Range = 'A2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],dd,sheet,x2Range);
x3Range = 'B2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],cCuat,sheet,x3Range);
x4Range = 'C2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],cNiat,sheet,x4Range);
x5Range = 'D2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],yna_Cu(b10_Cu:b90_Cu),sheet,x5Range);    
x6Range = 'E2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],D_Cu(b10_Cu:b90_Cu),sheet,x6Range);
x7Range = 'F2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x7Range);
x8Range = 'G2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],q_Cu,sheet,x8Range);
x9Range = 'G3';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],(fit_Cu)',sheet,x9Range);
xlRange = 'H1';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'c(Chem-Ni)','D(Chem-Ni)'},sheet,xlRange)
x10Range = 'H2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],yna_Ni(b10_Ni:b90_Ni),sheet,x10Range);    
x11Range = 'I2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],D_Ni(b10_Ni:b90_Ni),sheet,x11Range)    
x12Range = 'J2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x12Range);
x13Range = 'K2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],q_Ni,sheet,x13Range);
x14Range = 'K3';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],(fit_Ni)',sheet,x14Range);
else
sheet = 2;
xlRange = 'A1';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'d [µm]','c(Cu) [at%]','c(Ni) [at%]','c(Chem-Cu)','D(Chem-Cu)'},sheet,xlRange)
x2Range = 'A2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],dd,sheet,x2Range);
x3Range = 'B2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],cCuat,sheet,x3Range);
x4Range = 'C2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],cNiat,sheet,x4Range);
x5Range = 'D2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],handles.cn_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),sheet,x5Range);    
x6Range = 'E2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],handles.D_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),sheet,x6Range);
x7Range = 'F2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x7Range);
x8Range = 'G2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],q_Cu,sheet,x8Range);
x9Range = 'G3';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],(fit_Cu)',sheet,x9Range);
xlRange = 'H1';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'c(Chem-Ni)','D(Chem-Ni)'},sheet,xlRange)
x10Range = 'H2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],handles.cn_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),sheet,x10Range);    
x11Range = 'I2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],handles.D_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),sheet,x11Range)    
x12Range = 'J2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x12Range);
x13Range = 'K2';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],q_Ni,sheet,x13Range);
x14Range = 'K3';
    xlswrite([Path, strrep(File, '.txt', '_D.xls')],(fit_Ni)',sheet,x14Range);    
    
end

% --- Executes on button press in Export2.
function Export2_Callback(hObject, eventdata, handles)
% hObject    handle to Export2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

            Path = handles.Path;
            File = handles.File;
            dd = handles.dd;
            cCuat = handles.cCuat;
            cNiat = handles.cNiat;
            cn_Cu = handles.cn_Cu;
            cn_Ni= handles.cn_Ni ;
            yna_Cu = handles.yna_Cu;
            yna_Ni = handles.yna_Ni;
            yd1a_Cu = handles.yd1a_Cu;
            yd1a_Ni = handles.yd1a_Ni;
            IAa_Cu = handles.IAa_Cu; 
            IAa_Ni = handles.IAa_Ni;
            IEDa_Cu = handles.IEDa_Cu;
            IEDa_Ni = handles.IEDa_Ni;   
            D_Cu = handles.D_Cu;
            D_Ni = handles.D_Ni;
            b10_Ni = handles.b10_Ni;
            b90_Ni = handles.b90_Ni;
            b10_Cu = handles.b10_Cu;
            b90_Cu = handles.b90_Cu;
            fit_Cu = handles.fit_Cu;
            fit_Ni = handles.fit_Ni;
            q_Cu = handles.q_Cu;
            q_Ni = handles.q_Ni;
            dd_Cu = handles.dd_Cu;
            dd_Ni = handles.dd_Ni;
            v = handles.v;
            
if handles.m == 1            
sheet = 1;
xlRange = 'A1';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'d [µm]','c(Cu) [at%]','c(Ni) [at%]','c(Chem-Cu)','D(Chem-Cu)','d-fit [µm]','c(Cu)-fit [at%]','dc(Cu)/dx','I(A)','I(ED)'},sheet,xlRange)
x2Range = 'A2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],dd,sheet,x2Range);
x3Range = 'B2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],cCuat,sheet,x3Range);
x4Range = 'C2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],cNiat,sheet,x4Range);
x5Range = 'D2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yna_Cu(b10_Cu:b90_Cu),sheet,x5Range);    
x6Range = 'E2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],D_Cu(b10_Cu:b90_Cu),sheet,x6Range);
x3Range = 'F2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],dd_Cu,sheet,x3Range);
x3Range = 'G2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yna_Cu,sheet,x3Range);
x4Range = 'H2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yd1a_Cu,sheet,x4Range);
x5Range = 'I2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IAa_Cu,sheet,x5Range);    
x6Range = 'J2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IEDa_Cu,sheet,x6Range);    
x7Range = 'K2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x7Range);
x8Range = 'L2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],q_Cu,sheet,x8Range);
x9Range = 'L3';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],(fit_Cu)',sheet,x9Range);
xlRange = 'M1';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'c(Chem-Ni)','D(Chem-Ni)','d-fit [µm]','c(Ni)-fit [at%]','dc(Ni)/dx','I(A)','I(ED)'},sheet,xlRange)
x10Range = 'M2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yna_Ni(b10_Ni:b90_Ni),sheet,x10Range);    
x11Range = 'N2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],D_Ni(b10_Ni:b90_Ni),sheet,x11Range)    
x3Range = 'O2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],dd_Ni,sheet,x3Range);
x3Range = 'P2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yna_Ni,sheet,x3Range);
x4Range = 'Q2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yd1a_Ni,sheet,x4Range);
x5Range = 'R2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IAa_Ni,sheet,x5Range);    
x6Range = 'S2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IEDa_Ni,sheet,x6Range);  
x12Range = 'T2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x12Range);
x13Range = 'U2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],q_Ni,sheet,x13Range);
x14Range = 'U3';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],(fit_Ni)',sheet,x14Range);
else
sheet = 2;
xlRange = 'A1';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'d [µm]','c(Cu) [at%]','c(Ni) [at%]','c(Chem-Cu)','D(Chem-Cu)','d-fit [µm]','c(Cu)-fit [at%]','dc(Cu)/dx','I(A)','I(ED)'},sheet,xlRange)
x2Range = 'A2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],dd,sheet,x2Range);
x3Range = 'B2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],cCuat,sheet,x3Range);
x4Range = 'C2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],cNiat,sheet,x4Range);
x5Range = 'D2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],handles.cn_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),sheet,x5Range);    
x6Range = 'E2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],handles.D_Cu(handles.b10_Cu(1):handles.b90_Cu(1),1),sheet,x6Range);
x3Range = 'F2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],dd_Cu,sheet,x3Range);
x3Range = 'G2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yna_Cu,sheet,x3Range);
x4Range = 'H2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yd1a_Cu,sheet,x4Range);
x5Range = 'I2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IAa_Cu,sheet,x5Range);    
x6Range = 'J2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IEDa_Cu,sheet,x6Range);    
x7Range = 'K2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x7Range);
x8Range = 'L2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],q_Cu,sheet,x8Range);
x9Range = 'L3';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],(fit_Cu)',sheet,x9Range);
xlRange = 'M1';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'c(Chem-Ni)','D(Chem-Ni)','d-fit [µm]','c(Ni)-fit [at%]','dc(Ni)/dx','I(A)','I(ED)'},sheet,xlRange)
x10Range = 'M2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],handles.cn_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),sheet,x10Range);    
x11Range = 'N2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],handles.D_Ni(handles.b10_Ni(1):handles.b90_Ni(1),1),sheet,x11Range)    
x3Range = 'O2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],dd_Ni,sheet,x3Range);
x3Range = 'P2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yna_Ni,sheet,x3Range);
x4Range = 'Q2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],yd1a_Ni,sheet,x4Range);
x5Range = 'R2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IAa_Ni,sheet,x5Range);    
x6Range = 'S2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],IEDa_Ni,sheet,x6Range);  
x12Range = 'T2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],{'R square';'A';'B';'C';'D';'E'},sheet,x12Range);
x13Range = 'U2';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],q_Ni,sheet,x13Range);
x14Range = 'U3';
    xlswrite([Path, strrep(File, '.txt', '_Dall.xls')],(fit_Ni)',sheet,x14Range);    
    
end