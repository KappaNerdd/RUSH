function PlayerCollision(_x, _y) {
	var _extraSense = yspd;
	
	if (place_meeting(_x, _y, obj_Solid) 
	|| (place_meeting(_x, _y, obj_SolidA) && terrainLayer == 0)
	|| (place_meeting(_x, _y, obj_SolidB) && terrainLayer == 1)) {
		onPlatform = false;
		return true;
	}

	//Check for platform
	if (place_meeting(_x, _y + _extraSense, obj_SemiSolid)) && ground {
	    if (!onPlatform) {
	        if (angleMode == 0) {
	            onPlatform = true;
	            return true;
	        }
	    }
	}
	
	//Check for Rails
	if ((place_meeting(_x, _y + _extraSense, obj_RailParentA) && terrainLayer == 0) 
	|| (place_meeting(_x, _y + _extraSense, obj_RailParentB) && terrainLayer == 1) 
	|| place_meeting(_x, _y + _extraSense, obj_RailParent)) && ground {
		onPlatform = false;
		return true;
	}

	return false;
}

/// @description  PlayerCollisionMain(x, y)
/// @param x
/// @param  y
function PlayerCollisionMain(argument0, argument1) {
	//Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = maskMain;

	sensorX = floor(argument0);
	sensorY = floor(argument1);

	//Test collision
	collisionTest = PlayerCollision(sensorX, sensorY);

	//Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionObjectMain(x, y, object)
/// @param x
/// @param  y
/// @param  object
function PlayerCollisionObjectMain(argument0, argument1, argument2) {
	//Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = maskMain;

	sensorX = floor(argument0);
	sensorY = floor(argument1)
	//Test collision
	collisionTest = instance_place(sensorX, sensorY, argument2);

	//Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionTop( x, y, angle, mask );
/// @param  x
/// @param  y
/// @param  angle
/// @param  mask 
function PlayerCollisionTop(argument0, argument1, argument2, argument3) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 - sensorSin * sensorTopDistance);
	sensorY = floor(argument1 - sensorCos * sensorTopDistance);

	// Test collision
	collisionTest = PlayerCollision(sensorX, sensorY);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionObjectTop(x, y, angle, mask, object)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
/// @param  object
function PlayerCollisionObjectTop(argument0, argument1, argument2, argument3, argument4) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 - sensorSin * sensorTopDistance);
	sensorY = floor(argument1 + sensorCos * sensorTopDistance);

	// Test collision with the specified object
	collisionTest = instance_place(sensorX, sensorY, argument4);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionBottom(x, y, angle, mask)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
function PlayerCollisionBottom(argument0, argument1, argument2, argument3) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 + sensorSin * sensorBottomDistance);
	sensorY = floor(argument1 + sensorCos * sensorBottomDistance);

	// Test collision
	collisionTest = PlayerCollision(sensorX, sensorY);

	// Test platform collision
	if (!collisionTest && yspd >= 0 && !ground) {
	    collisionTest = (place_meeting(sensorX, sensorY, obj_SemiSolid) && !place_meeting(floor(argument0), floor(argument1), obj_SemiSolid)) or (place_meeting(sensorX, sensorY, obj_RailParent) && !place_meeting(floor(argument0), floor(argument1), obj_RailParent)) or (place_meeting(sensorX, sensorY, obj_RailParentB) && !place_meeting(floor(argument0), floor(argument1), obj_RailParentB) && terrainLayer == 1) or (place_meeting(sensorX, sensorY, obj_RailParentA) && !place_meeting(floor(argument0), floor(argument1), obj_RailParentA) && terrainLayer == 0);
	}

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionObjectBottom(x, y, angle, mask, object)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
/// @param  object
function PlayerCollisionObjectBottom(argument0, argument1, argument2, argument3, argument4) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 + sensorSin * sensorBottomDistance);
	sensorY = floor(argument1 + sensorCos * sensorBottomDistance);

	// Test collision
	collisionTest = instance_place(sensorX, sensorY, argument4);

	// Set to the old mask
	mask_index = maskTemp;

	// Return result
	return collisionTest;
}

/// @description  PlayerCollisionSlope(x, y, angle, mask)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
function PlayerCollisionSlope(argument0, argument1, argument2, argument3) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorCos = dcos(argument2);
	sensorSin = dsin(argument2);

	sensorX = floor(argument0 + sensorSin * 22);
	sensorY = floor(argument1 + sensorCos * 22);

	// Test collision
	collisionTest = PlayerCollision(sensorX, sensorY);

	// Set to the old mask
	mask_index = maskTemp;

	// Return result
	return collisionTest;
}

/// @description  PlayerCollisionLeft(x, y, angle, mask)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
function PlayerCollisionLeft(argument0, argument1, argument2, argument3) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 - sensorCos * sensorLeftDistance);
	sensorY = floor(argument1 + sensorSin * sensorLeftDistance);

	// Test collision
	collisionTest = PlayerCollision(sensorX, sensorY);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionObjectLeft( x, y, angle, mask, object );
/// @param  x
/// @param  y
/// @param  angle
/// @param  mask
/// @param  object 
function PlayerCollisionObjectLeft(argument0, argument1, argument2, argument3, argument4) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 - sensorCos * sensorLeftDistance);
	sensorY = floor(argument1 + sensorSin * sensorLeftDistance);

	// Test collision with the specified object
	collisionTest = instance_place(sensorX, sensorY, argument4);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionLeftEdge(x, y, angle)
/// @param x
/// @param  y
/// @param  angle
function PlayerCollisionLeftEdge(argument0, argument1, argument2) {
	sensorCos = dcos(argument2);
	sensorSin = dsin(argument2);

	sensorX = argument0 - sensorCos * 8 + sensorSin * 8;
	sensorY = argument1 + sensorSin * 8 + sensorCos * 8;

	if (collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_Solid, 1, 0)) {
	    return true;
	}
	
	if (collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_RailParent, 1, 0)) {
	    return true;
		railGrind = true;
	}

	// Check for platform
	if (collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_SemiSolid, 1, 0) && ground) {
	    return true;
	}

	switch (terrainLayer) {
	    //Check for low layer
	    case 0:
	        if (collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_SolidA, 1, 0)) {
	            return true;
				railGrind = false;
	        }
			
			if collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_RailParentA, 1, 0) {
				return true;
				railGrind = true;
			}
	    break;

	    //Check for high layer
	    case 1:
	        if (collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_SolidB, 1, 0)) {
	            return true;
				railGrind = false;
	        }
			
			if collision_line(sensorX, sensorY, argument0 - sensorCos * 8 + sensorSin * 36, argument1 + sensorSin * 8 + sensorCos * 36, obj_RailParentB, 1, 0) {
				return true;
				railGrind = true;
			}
	    break;
	}

	return false;
}

/// @description  PlayerCollisionRight(x, y, angle, mask)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
function PlayerCollisionRight(argument0, argument1, argument2, argument3) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	// Calculate sensorSin and sensorCos
	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 + sensorCos * sensorRightDistance);
	sensorY = floor(argument1 - sensorSin * sensorRightDistance);

	// Test collision
	collisionTest = PlayerCollision(sensorX, sensorY);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionObjectRight(x, y, angle, mask, object)
/// @param x
/// @param  y
/// @param  angle
/// @param  mask
/// @param  object
function PlayerCollisionObjectRight(argument0, argument1, argument2, argument3, argument4) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = argument3;

	// Calculate sensorSin and sensorCos
	sensorSin = dsin(argument2);
	sensorCos = dcos(argument2);

	// Calculate sensor position
	sensorX = floor(argument0 + sensorCos * sensorRightDistance);
	sensorY = floor(argument1 - sensorSin * sensorRightDistance);

	// Test collision with the specified object
	collisionTest = instance_place(sensorX, sensorY, argument4);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionRightEdge(x, y, angle)
/// @param x
/// @param  y
/// @param  angle
function PlayerCollisionRightEdge(argument0, argument1, argument2) {
	sensorCos = dcos(argument2);
	sensorSin = dsin(argument2);

	sensorX = argument0 + sensorCos * 8 + sensorSin * 8;
	sensorY = argument1 - sensorSin * 8 + sensorCos * 8;

	if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_Solid, 1, 0)) {
	    return true;
	}
	
	if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_RailParent, 1, 0)) {
	    return true;
		railGrind = true;
	}

	// Check for platform
	if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_SemiSolid, 1, 0) && ground) {
	    return true;
	}

	switch (terrainLayer) {
	    // Check for low layer
	    case 0:
	        if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_SolidA, 1, 0)) {
	            return true;
				railGrind = false;
	        }
			
			if collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_RailParentA, 1, 0) {
				return true;
				railGrind = true;
			}
	    break;

	    // Check for high layer
	    case 1:
	        if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_SolidB, 1, 0)) {
	            return true;
				railGrind = false;
	        }
			
			if collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, obj_RailParentB, 1, 0) {
				return true;
				railGrind = true;
			}
	    break;
	}

	return false;
}

/// @description  PlayerCollisionHitbox(x, y, object);
/// @param x
/// @param  y
/// @param  object
function PlayerCollisionHitbox(argument0, argument1, argument2) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = maskHitbox;

	sensorX = floor(argument0);
	sensorY = floor(argument1);

	// Test collision
	collisionTest = instance_place(sensorX, sensorY, argument2);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

/// @description  PlayerCollisionHitboxFast(x, y, object);
/// @param x
/// @param  y
/// @param  object
function PlayerCollisionHitboxFast(argument0, argument1, argument2) {
	// Store the actual mask for setting it up later
	maskTemp = mask_index;
	mask_index = maskHitbox;

	// Test collision
	collisionTest = place_meeting(argument0, argument1, argument2);

	// Set to the old mask
	mask_index = maskTemp;

	return collisionTest;
}

function PlayerCollisionCache() {
	var _x, _y;
	_x = floor(x);
	_y = floor(y);
	// Cache collisions
	edgeCollision = PlayerCollisionLeftEdge(_x, _y, angle) && PlayerCollisionRightEdge(_x, _y, angle);
	bottomCollision = PlayerCollisionBottom(_x, _y, angle, maskBig);
	
	leftEdge = PlayerCollisionLeftEdge(_x, _y, angle);
	rightEdge = PlayerCollisionRightEdge(_x, _y, angle);
}

/// @description  PlayerGetAngle(x, y, angle)
/// @param _x
/// @param _y
/// @param _angle
function PlayerGetAngle(_x, _y, _angle) {
	// Limit the angle to 32 directions to maintain stability and reduce jittering
	_angle = round(_angle / 11.25) * 11.25;

	// Store temporary values
	maskTemp = mask_index;
	mask_index = maskMid;

	var _angleCOS, _angleSIN;
	
	_angleCOS = dcos(_angle);
	_angleSIN = dsin(_angle);

	// Set the starting position of the sensors based on the angle
	var _pointLeftX, _pointLeftY, _pointRightX, _pointRightY;
	
	_pointLeftX = floor(_x - _angleCOS * 6);
	_pointLeftY = floor(_y + _angleSIN * 7);

	_pointRightX = floor(_x + _angleCOS * 6);
	_pointRightY = floor(_y - _angleSIN * 7);

	var _collisionLeft, _collisionRight;
	
	_collisionLeft = false;
	_collisionRight = false;
	// Check if it is colliding with the ground
	// Now, perform the checking. Push down the two points in order to touch the floor
	repeat (20) {
	    if (!_collisionLeft && PlayerCollision(_pointLeftX, _pointLeftY)) {
	        _collisionLeft = true;
	    } else if (!_collisionLeft) {
	        _pointLeftX += _angleSIN;
	        _pointLeftY += _angleCOS;
	    }

	    if (!_collisionRight && PlayerCollision(_pointRightX, _pointRightY)) {
	        _collisionRight = true;
	    } else if (!_collisionRight) {
	        _pointRightX += _angleSIN;
	        _pointRightY += _angleCOS;
	    }

	    // If both points are colliding, break the loop
	    if (_collisionLeft && _collisionRight) {
	        break;
	    }
	}

	// Restore the previous mask
	mask_index = maskTemp;

	// Calculate and return the direction
	return point_direction(_pointLeftX, _pointLeftY, _pointRightX, _pointRightY);
}

function PlayerSetAngle(_angle) {
	angle = _angle;
	angleMode = round(angle / 45) mod 8;
	PlayerAngleLocals();
}

function PlayerAngleLocals() {
	angleCos = dcos(angle);
	angleSin = dsin(angle);
}

function PlayerSetGround(value) {
	ground = value;
	
	if ground {
		jumping = false;
		realJumping = false;
		dJumping = false;
	} else {
		sliding = false;
		jumping = true;
		onPlatform = false
	}
}

function PlayerFlight() {
	if !rampRing && !afterRailJump && !realJumping {
		yspd = -angleSin * vel;
		vel = angleCos * vel;
	}
	
	PlayerSetGround(false);
	PlayerSetAngle(0);
}

function PlayerJumpAct() {
	yspd = angleCos * -normalJspd - angleSin * vel;
	vel = angleCos * vel + angleSin * -normalJspd;
	
	xDirection = sign(vel);
	
	PlayerSetGround(false);
}

function PlayerXMovement() {
	getCharacterControls();
	
	var _xAcceleration, _xFriction, _xBrakeFriction;
	
	if (ground) {
	    _xAcceleration = xAcceleration;
	    _xFriction = xFriction;
	    _xBrakeFriction = (xFriction * 1.7);
	}
	else {
	    _xAcceleration = (xAcceleration * 1.2);
	    _xFriction = 0;
	    _xBrakeFriction = 0;
	}

	// Acceleration
	// Accelerate to the left
	if (left_Key && !right_Key) {
	    if (xSpeed > -xTopSpeed) {
	        xSpeed -= _xAcceleration;
	    }

	    // Friction
	    if (xSpeed > 0) {
	        xSpeed -= _xBrakeFriction;
	    }
	}
	// Accelerate to the right
	else
	if (right_Key && !left_Key) {
	    if (xSpeed < xTopSpeed) {
	        xSpeed += _xAcceleration;
	    }

	    // Friction
	    if (xSpeed < 0) {
	        xSpeed += _xBrakeFriction;
	    }
	}
	else {
	    xSpeed = Approach(xSpeed, 0, _xFriction);
	}
	
	if jump_Key && ground {
		PlayerSetGround(false);
		
		if (left_Key) {
		    xDirection = -1;
		}

		if (right_Key) {
		    xDirection = 1;
		}

		// Air drag
		if (ySpeed < 0 && ySpeed >= -4) {
		    xSpeed -= ((xSpeed / 0.2) / 256);
		}

		// Reset after touching the ground
	}
	
	if ground {
	    PlayerSetGround(true);
	}
}

function PlayerXMovementExt(_xAcceleration, _xFriction, _xTopSpeed) {
	var _xBrakeFriction = (_xFriction * 1.7);

	// Acceleration
	// Accelerate to the left
	if (keyLeft && !keyRight) {
	    if (xSpeed > -_xTopSpeed) {
	        xSpeed -= _xAcceleration;
	    }

	    // Friction
	    if (xSpeed > 0){
	        xSpeed -= _xBrakeFriction;
	    }
	}
	// Accelerate to the right
	else
	if (keyRight && !keyLeft) {
	    if (xSpeed < _xTopSpeed) {
	        xSpeed += _xAcceleration;
	    }

	    // Friction
	    if (xSpeed < 0) {
	        xSpeed += _xBrakeFriction;
	    }
	}
	else {
	    xSpeed = Approach(xSpeed, 0, _xFriction);
	}
}

function PlayerJump() {
	if (!PlayerCollisionTop(x, y, angle, maskBig) && keyActionPressed) {
	    PlayerSetState(PlayerStateJump);
	}
}

function Approach(_start, _end, _shift) {
	if (_start < _end) {
	    return min(_start + _shift, _end); 
	} else {
	    return max(_start - _shift, _end);
	}
}

function ApproachAngle(val, to, amount) {
    var delta = angle_difference(to, val)
    if (abs(delta) < amount)
        return to
    var sp = amount * sign(delta)
    return val + sp
}

function PlayerHandleLayers() {
	if ground {
		terrainVel = vel;
	}
	
	//Layer 0
	if PlayerCollisionObjectMain(x, y, obj_SwitchLayerA) {
		terrainLayer = 0;
	}

	//Layer switch
	if PlayerCollisionObjectMain(x, y, obj_SwitchLayerAlt) {
		//Switch to layer 1
		if terrainVel > 0 {
		    terrainLayer = 1;
		}

		//Switch to layer 0
		if terrainVel < 0 {
		    terrainLayer = 0;
		}
	}
	
	if PlayerCollisionObjectMain(x, y, obj_SwitchLayerOtherAlt) {
		//Switch to layer 1
		if terrainVel < 0 {
		    terrainLayer = 1;
		}

		//Switch to layer 0
		if terrainVel > 0 {
		    terrainLayer = 0;
		}
	}

	//Layer 1
	if PlayerCollisionObjectMain(x, y, obj_SwitchLayerB) {
		terrainLayer = 1;
	}
}
	
	