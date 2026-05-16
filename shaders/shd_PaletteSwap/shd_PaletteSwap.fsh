//
// Sample passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D samp_target;
uniform sampler2D samp_replace;

void main() {
	vec4 sampled = texture2D(gm_BaseTexture, v_vTexcoord);
	
	for(float i = 0.0; i < 20.0; i += 1.0) {
		vec3 target = texture2D(samp_target, vec2(i / 20.0, 0.0)).rgb;
		
		if (distance(target, sampled.rgb) < 0.001) {
			sampled.rgb = texture2D(samp_replace, vec2(i / 20.0, 0.0)).rgb;
		}
	}
	
	gl_FragColor = sampled * v_vColour;
}