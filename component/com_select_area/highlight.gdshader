shader_type canvas_item; 

uniform float highlight : hint_range(0.0, 1.0);

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	COLOR = vec4(mix(color.rgb, vec3(1.0), highlight), color.a);
}