using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateObject : MonoBehaviour
{
    public float rotationSpeedY = 0.0f; // Adjust the speed of rotation in degrees per second
    public float rotationSpeedX = 0.0f;
    public float rotationSpeedZ = 0.0f;

    // Update is called once per frame
    void Update()
    {
        // Rotate the object on the Y-axis
        transform.Rotate(Vector3.up * rotationSpeedY * Time.deltaTime);

        transform.Rotate(Vector3.right * rotationSpeedX * Time.deltaTime);

        transform.Rotate(Vector3.forward * rotationSpeedZ * Time.deltaTime);
    }
}
