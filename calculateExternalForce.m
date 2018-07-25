function linearForce = calculateExternalForce(V, P, q0, q0p, Pbig, disG, cExp, linearSum, x)
    % Get most right side Y axis nodes.
	rightV = (V(:, 1) == max(V(:, 1)));
    
    % Activate those node.
	keyframeNodePosition = 1*rightV;
	%nodeV = reshape(nodeV, size(V, 1), size(V, 2));
    shapeV = zeros(size(V, 1), size(V, 2));
	shapeV(:, 2) = shapeV(:, 2) + keyframeNodePosition;
	Vdis = shapeV';
	Vrolled = Vdis(:);
	q0(1:end/2, :) = Vrolled;
    keyframe = q0;
	keyframe(1:end/2, :) = Vrolled;
	keyframeQ = Pbig * keyframe;
	R = diag(rightV);
	R(sum(R, 1) == 0, :) = [];
	R = kron(R, [0,0,0;0,1,0;0,0,0]);
	%Rp = (R*P');
	Rbig = [R, zeros(size(R, 1), size(R, 2));...
	    zeros(size(R, 1), size(R, 2)), R]; 
    Rpbig = Rbig * Pbig';
	linearForceTerm = Rpbig*keyframeQ - (Rpbig*cExp*q0p - Rpbig*disG);
	linearForce = (Rpbig*linearSum)\linearForceTerm;
    %linearForce(end/2+1:end) = linearForce(end/2+1:end).*(keyframeQ(1:end/2)~=0);
%     yAxisForce = reshape(linearForce(end/2+1:end), 3, 200);
%     yAxisForce(1, :) = 0;
%     yAxisForce(3, :) = 0;
%     yAxisForce = yAxisForce(:);
%     linearForce((end/2+1):end) = yAxisForce;
    

end
