function [out,f_x,f_y]=optimize_circle_3(jtest,xi,yi,radius,region)
[xs,ys]=size(jtest);
% mamapu=(~(jtest==500)).*jtest;

% avgu=sum(sum(mamapu))/sum(sum(~(jtest==500)));
% totalu=sum(sum(jtest<499));
% cat2=sum(sum(jtest<(avgu/10)));
% cat1=max(max(mamapu))-min(min(jtest));
% region=12;
num=1;
for ii=fix(xi)-region:fix(xi)+region
    for jj=fix(yi)-region:fix(yi)+region
        newmap1=find_new_map(xs,ys,ii,jj,radius);
        numnumnum=newmap1.*jtest;
%         [xsnum*ysnum]=size(numnumnum);
%         rspnumnum=reshape(numnumnum,xsnum*ysnum,1);
        
        
        sumic(num,3)=sum(sum(numnumnum))/sum(sum(newmap1));
        sumic(num,4)=std(deletezeros_umc(numnumnum));
        
        sumic(num,2)=jj;
        sumic(num,1)=ii;
        
        
        num=num+1;
    end
end
% [aa,bb]=min(sumic(:,3));
[aa,bb]=min(sumic(:,3)+(50*sumic(:,4)));
% if cat1>=avgu && cat2>(totalu/100)
%     f_x=xi;
%     f_y=yi;
%     0
% else
f_x=sumic(bb,1);
f_y=sumic(bb,2);
out=find_new_map(xs,ys,f_x,f_y,radius);
% 1
% end

% imagesc(jtest)
% newmap1=find_new_map(xs,ys,f_x,f_y,30);
%    hold on
%    contour(newmap1,[0,1],'b')
        
        
