function varargout = polarizer_gui(varargin)
% POLARIZER_GUI MATLAB code for polarizer_gui.fig
%      POLARIZER_GUI, by itself, creates a new POLARIZER_GUI or raises the existing
%      singleton*.
%
%      H = POLARIZER_GUI returns the handle to a new POLARIZER_GUI or the handle to
%      the existing singleton*.
%
%      POLARIZER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLARIZER_GUI.M with the given input arguments.
%
%      POLARIZER_GUI('Property','Value',...) creates a new POLARIZER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before polarizer_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to polarizer_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help polarizer_gui

% Last Modified by GUIDE v2.5 16-May-2016 20:35:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @polarizer_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @polarizer_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before polarizer_gui is made visible.
function polarizer_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to polarizer_gui (see VARARGIN)

bindViews(0)
text(16,5,-0.5,'5','FontSize',18,'FontWeight','bold');
hold off

% Choose default command line output for polarizer_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes polarizer_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = polarizer_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function bindViews(theta)

    hold off
    r=3;
    teta=-pi:0.01:pi;
    y=r*cos(teta);
    z=r*sin(teta);

    for i = [0.5,0.55,0.6,0.65,0.70,0.75,0.80,0.85,0.90]
        patch(zeros(1,numel(y)) + i, y+3, z+8,'blue','FaceAlpha',.05,'EdgeColor','blue','LineStyle','-')
    end

    axis ([0 20 0 15 0 15])

    hold on

    for i = [10.5,10.55,10.6,10.65,10.70,10.75,10.80,10.85,10.90]
        surf = patch(zeros(1,numel(y))+i,y+3,z+8, 'blue','FaceAlpha',.05,'EdgeColor','blue','LineStyle','-');
        rotate(surf, [0,1,0], theta);
    end

    %plot3(zeros(1,numel(y))+3,y+3,z+8, 'r--')

    title('Polarizer Simulation Model')

    text(-6,5,7.5,'LED Source','FontSize',11);
    text(-6,5,6.5,'(5V)','FontSize',11);
    text(-2,5,12.5,'Polarizer 1','FontSize',11);
    text(10,5,12,'Polarizer 2','FontSize',11);
    text(16,5,1.5,'PhotoTransistor:','FontSize',11);

    hold on
