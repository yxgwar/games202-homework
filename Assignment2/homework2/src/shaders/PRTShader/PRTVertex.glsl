attribute vec3 aVertexPosition;
attribute vec3 aNormalPosition;
attribute mat3 aPrecomputeLT;

uniform mat4 uModelMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uPrecomputeL[3];

varying highp vec3 vNormal;
varying highp mat3 vPrecomputeLT;
varying highp vec3 vColor;

void main(void) {
    vNormal = (uModelMatrix * vec4(aNormalPosition, 0.0)).xyz;

    for(int i = 0; i < 3; i++)
    {
        vColor[i] = dot(aPrecomputeLT[0], uPrecomputeL[i][0]) + dot(aPrecomputeLT[1], uPrecomputeL[i][1]) + dot(aPrecomputeLT[2], uPrecomputeL[i][2]);
    }

    gl_Position = uProjectionMatrix * uViewMatrix * uModelMatrix * vec4(aVertexPosition, 1.0);
}