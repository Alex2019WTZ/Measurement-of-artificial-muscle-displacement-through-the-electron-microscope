function [] = refreash(val_max)
       subplot(1,5,5);
       fplot(val_max,'-g');
       ylim([0 20]);
       text(0,18,num2str(val_max));
end