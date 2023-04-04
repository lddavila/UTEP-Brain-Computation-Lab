function [newDirectory] = storeClustersInNewDirectory(nameOfNewDirectory)
mkdir(nameOfNewDirectory)
ogDirectory = cd(nameOfNewDirectory);
newDirectory = cd(ogDirectory);

end