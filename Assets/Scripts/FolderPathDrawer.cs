using UnityEngine;
using System.IO;
#if UNITY_EDITOR
using UnityEditor;


[CustomPropertyDrawer(typeof(FolderPathAttribute))]
public class FilePathDrawer : PropertyDrawer
{

    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
    {
        if (property.propertyType != SerializedPropertyType.String)
        {
            EditorGUI.HelpBox(position, "Only for string type", MessageType.Error);
            return;
        }

        EditorGUI.BeginProperty(position, label, property);

        Rect buttonPosition = new Rect(position.x + position.width - 30, position.y, 30, position.height);
        Rect textPosition = new Rect(position.x, position.y, position.width - buttonPosition.width - 5, position.height);
        EditorGUI.TextField(textPosition, label, property.stringValue);

        if (GUI.Button(buttonPosition, "..."))
        {
            string dirpath = "";
            if (Directory.Exists(property.stringValue))
            {
                dirpath = Path.GetDirectoryName(property.stringValue);
            }

            FolderPathAttribute filepath = (FolderPathAttribute)attribute;
            string path = EditorUtility.OpenFolderPanel("Choose folder to save", dirpath, null);
            property.stringValue = path;
        }

        EditorGUI.EndProperty();

    }

}

#endif