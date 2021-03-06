// 09.10.29
// 10.02.07 debugged

function NohiddenL=Faceremovaldata(FL,CLadd,PT)
  global PHHIDDENDATA VELNO VELHI;
  NohiddenL=list();
  HiddenL=list();
  Eps=10^(-4);
    if mtlb_findstr(PT,'para')~=[]
    Ptype=1;  //para
  else
    Ptype=-1;   //pers
  end;
  if length(CLadd)>0
    if type(CLadd)==1
      C=list();
      if size(CLadd,1)>1
        for I=1:size(CLadd,1)
          C($+1)=CLadd(I,:);
        end;
      else
        for I=1:3:size(CLadd,2)
          C($+1)=CLadd(1,I:I+2);
        end;
      end;
      CrvL=list(C);
    elseif type(CLadd(1))==1
      CrvL=list();
      for J=1:length(CLadd)//
        Ctmp=CLadd(J);
        C=list();
        if size(Ctmp,1)>1
          for I=1:size(Ctmp,1)
            C($+1)=Ctmp(I,:);
          end;
        else
          for I=1:3:size(Ctmp,2)
            C($+1)=Ctmp(1,I:I+2);
          end;
        end;
        CrvL($+1)=C;
      end;
    else
      CrvL=CLadd;
    end;
  else
    CrvL=list();
  end;
  VELNO=list();
  for I=1:length(CrvL)
    Tmp=CrvL(I);
    for J=1:length(Tmp)-1
      Edge=list(Tmp(J),Tmp(J+1));
      Ntmp=length(VELNO);                //
      VELNO(Ntmp+1)=list(Edge,0,Ntmp+1); //
    end;
  end;
  VELHI=list();
  Out=MakeveLfaceL(FL);
  FaceL=Out(2);
  for Nf=1:length(FaceL)
    Face=FaceL(Nf);
    Menkakusi2(Face,Nf,Ptype);
  end;
  for I=1:length(VELNO)
    Edge=Op(1,VELNO(I));
    if norm(Edge(1)-Edge(2))>Eps
      NohiddenL($+1)=Spaceline(Edge);
    end;
  end;
  for I=1:length(VELHI)
    Edge=Op(1,VELHI(I));
    if norm(Edge(1)-Edge(2))>Eps
      HiddenL($+1)=Spaceline(Edge);
    end;
  end;
  PHHIDDENDATA=HiddenL;
endfunction
