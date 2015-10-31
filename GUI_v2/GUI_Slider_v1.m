function varargout = GUI_Slider_v1(varargin)
% GUI_SLIDER_V1 MATLAB code for GUI_Slider_v1.fig
%      GUI_SLIDER_V1, by itself, creates a new GUI_SLIDER_V1 or raises the existing
%      singleton*.
%
%      H = GUI_SLIDER_V1 returns the handle to a new GUI_SLIDER_V1 or the handle to
%      the existing singleton*.
%
%      GUI_SLIDER_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SLIDER_V1.M with the given input arguments.
%
%      GUI_SLIDER_V1('Property','Value',...) creates a new GUI_SLIDER_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Slider_v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Slider_v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Slider_v1

% Last Modified by GUIDE v2.5 31-Oct-2015 16:01:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Slider_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Slider_v1_OutputFcn, ...
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


% --- Executes just before GUI_Slider_v1 is made visible.
function GUI_Slider_v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Slider_v1 (see VARARGIN)

% Choose default command line output for GUI_Slider_v1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Slider_v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Slider_v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%% Get the Value of Slider Current Posistion
v = get(hObject,'Value'); 
disp('current position:')
disp(v)
%% set the min & max values to the slider.
set(handles.slider1,'Min',0);
set(handles.slider1,'Max',2*pi);

%% get the min & max values of the slider.
min = get(hObject,'Min');
Max = get(hObject,'Max');

%% display on command window : min & Max
%display(min);display(Max)
format short
sprintf('min = %d Max = %2.2d', min,Max)

%% Control the axis to plot the function on ot.
axes(handles.axes1);

%% Main function to plot on axis with the slider control.
t = linspace(min,Max,1000);
plot(t,sin(2*pi*v*t))

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
