function this = connectLayers(this, s, d)
% connectLayers   Connect layers in layer graph
%
%   LGRAPH = connectLayers(LGRAPH, S, D) connects a source
%   layer S to a destination layer D in the layer graph LGRAPH,
%   where S and D are character arrays or string scalars.
%     - If the source layer has a single output, then S is the
%       name of the layer. If the source layer has multiple
%       outputs, then S is the name of the layer followed by
%       the '/' character, followed by the name of the layer
%       output.
%     - If the destination layer has a single input, then D is
%       the name of the layer. If the destination layer has
%       multiple inputs, then D is the name of the layer
%       followed by the '/' character, followed by the name of
%       the layer input.

arguments
    this
    s     
    d    
end

