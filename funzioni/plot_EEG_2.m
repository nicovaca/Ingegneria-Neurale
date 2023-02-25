function plot_EEG_2(x,sequenzaelechar,fs,color)

finestra=x;  
n=size(x,1);

if(size(sequenzaelechar,1) > 1)
    for r=1:size(sequenzaelechar,1)
       sequenzaelechar_rev(r,:)=sequenzaelechar((n-r+1),:);
    end
end

% [finestra_scaled,scaling_par]=mapminmax(finestra,0,1);
 finestra_scaled=finestra./max(max(finestra));


for i=1:n
    
   % finestra_scaled(i,:)=mapminmax(finestra(i,:),0,max(finestra(i,:)));
    
   plot(finestra_scaled(i,:)+((n-i+1)-mean(finestra_scaled(i,:))),color), hold on; 
   set(gca,'XLim', [0 size(finestra_scaled,2)]);
   
end

                    set(gca,'YLimMode','manual');
                    set(gca,'YLim', [0 (n+1)]);
                    set(gca,'YTickMode','manual','YTick',[1:1:n]);
                    if(size(sequenzaelechar,1) > 1)
                        set(gca,'YTickLabel',sequenzaelechar_rev);
                    end
                    ylabel('EEG (uV)');
                    xlabel('Time (samples)');