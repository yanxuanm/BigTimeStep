function linearForce = calculateExternalForce(V, P, q0, q0p, Pbig, disG, cExp, linearSum, x)

    nodeApply = zeros(3*size(V, 1), 1);
    positions = [134, 269, 404, 539, 674];
    %[122, 125, 128, 131, 134, 257, 260, 263, 266, 269, 392, 395, 398, 401, 404, 527, 530, 533, 536, 539, 662, 665, 668, 671, 674];
    nodeApply(positions) = 1;
    nodeV = reshape(nodeApply, size(V, 2), size(V, 1));
    nodeV = nodeV';
    % Get most right side Y axis nodes.
	%rightV = (V(:, 1) == max(V(:, 1)));
    
    % Activate those node.
	keyframeNodePosition = 0.5*nodeV(:, 2);
	%nodeV = reshape(nodeV, size(V, 1), size(V, 2));
    shapeV = zeros(size(V, 1), size(V, 2));
	shapeV(:, 2) = shapeV(:, 2) + keyframeNodePosition;
	Vdis = shapeV';
	Vrolled = Vdis(:);
	q0(1:end/2, :) = Vrolled;
    keyframe = q0;
	keyframe(1:end/2, :) = Vrolled;
	keyframeQ = Pbig * keyframe;
	R = diag(nodeV(:,2));
	R(sum(R, 1) == 0, :) = [];
	R = kron(R, [0,0,0;0,1,0;0,0,0]);
	%Rp = (R*P');
	Rbig = [R, zeros(size(R, 1), size(R, 2));...
	    zeros(size(R, 1), size(R, 2)), R]; 
    Rpbig = Rbig * Pbig';
	linearForceTerm = Rpbig*keyframeQ - (Rpbig*cExp*q0p - Rpbig*disG);
	linearForce = real((Rpbig*linearSum)\linearForceTerm);
    %linearForce(end/2+1:end) = linearForce(end/2+1:end).*(keyframeQ(1:end/2)~=0);
%     yAxisForce = reshape(linearForce(end/2+1:end), 3, 200);
%     yAxisForce(1, :) = 0;
%     yAxisForce(3, :) = 0;
%     yAxisForce = yAxisForce(:);
%     linearForce((end/2+1):end) = yAxisForce;
    

end

