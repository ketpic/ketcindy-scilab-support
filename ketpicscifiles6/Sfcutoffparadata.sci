// 08.09.1
// 10.02.17

function Out=Sfcutoffparadata(varargin)
  Ms=list('hidden','para');
  for I=1:length(varargin)
    Tmp=varargin(I);
    Ms=Mixjoin(Ms,list(Tmp));
  end;
  Out=Makesfcutoffdata(Ms);
endfunction;

