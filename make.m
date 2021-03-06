clc, close all, clear all;
A2D_2010 = cell2mat(struct2cell(load('2010_A2D.mat')));
A2D_2011 = cell2mat(struct2cell(load('2011_A2D.mat')));
A2D_2012 = cell2mat(struct2cell(load('2012_A2D.mat')));
A2D_2013 = cell2mat(struct2cell(load('2013_A2D.mat')));
A2D_2014 = cell2mat(struct2cell(load('2014_A2D.mat')));
A2D_2015 = cell2mat(struct2cell(load('2015_A2D.mat')));
A2D_2016 = cell2mat(struct2cell(load('2016_A2D.mat')));
E1_2010 = cell2mat(struct2cell(load('2010_E1.mat')));
E1_2011 = cell2mat(struct2cell(load('2011_E1.mat')));
E1_2012 = cell2mat(struct2cell(load('2012_E1.mat')));
E1_2013 = cell2mat(struct2cell(load('2013_E1.mat')));
E1_2014 = cell2mat(struct2cell(load('2014_E1.mat')));
E1_2015 = cell2mat(struct2cell(load('2015_E1.mat')));
E1_2016 = cell2mat(struct2cell(load('2016_E2.mat')));
E2_2010 = cell2mat(struct2cell(load('2010_E2.mat')));
E2_2011 = cell2mat(struct2cell(load('2011_E2.mat')));
E2_2012 = cell2mat(struct2cell(load('2012_E2.mat')));
E2_2013 = cell2mat(struct2cell(load('2013_E2.mat')));
E2_2014 = cell2mat(struct2cell(load('2014_E2.mat')));
E2_2015 = cell2mat(struct2cell(load('2015_E2.mat')));
E2_2016 = cell2mat(struct2cell(load('2016_E2.mat')));
E3_2010 = cell2mat(struct2cell(load('2010_E3.mat')));
E3_2011 = cell2mat(struct2cell(load('2011_E3.mat')));
E3_2012 = cell2mat(struct2cell(load('2012_E3.mat')));
E3_2013 = cell2mat(struct2cell(load('2013_E3.mat')));
E3_2014 = cell2mat(struct2cell(load('2014_E3.mat')));
E3_2015 = cell2mat(struct2cell(load('2015_E3.mat')));
E3_2016 = cell2mat(struct2cell(load('2016_E3.mat')));
A = [A2D_2010(:,1);A2D_2011(:,1);A2D_2012(:,1);A2D_2013(:,1);A2D_2014(:,1);A2D_2015(:,1);A2D_2016(:,1)];
B1 = [A2D_2010(:,2);A2D_2011(:,2);A2D_2012(:,2);A2D_2013(:,2);A2D_2014(:,2);A2D_2015(:,2);A2D_2016(:,2)];
B2 = [A2D_2010(:,3);A2D_2011(:,3);A2D_2012(:,3);A2D_2013(:,3);A2D_2014(:,3);A2D_2015(:,3);A2D_2016(:,3)];
C = [A2D_2010(:,4);A2D_2011(:,4);A2D_2012(:,4);A2D_2013(:,4);A2D_2014(:,4);A2D_2015(:,4);A2D_2016(:,4)];
D = [A2D_2010(:,5);A2D_2011(:,5);A2D_2012(:,5);A2D_2013(:,5);A2D_2014(:,5);A2D_2015(:,5);A2D_2016(:,5)];
E1 = [E1_2010;E1_2011;E1_2012;E1_2013;E1_2014;E1_2015;E1_2016];
E2 = [E2_2010;E1_2011;E2_2012;E2_2013;E2_2014;E2_2015;E2_2016];
E3 = [E3_2010;E3_2011;E3_2012;E3_2013;E3_2014;E3_2015;E3_2016];
mat = struct('a',A,'b1',B1,'b2',B2,'c',C,'d',D,'e1',E1,'e2',E2,'e3',E3,'optimal',E2);
save('GPR.mat','mat');