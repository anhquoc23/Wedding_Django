import { StyleSheet } from "react-native";

export default StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 20,
        paddingVertical: 30,
        borderBottomWidth: 1,
        borderBottomColor: '#ccc',
      },
      avatar: {
        width: 50,
        height: 50,
        borderRadius: 25,
        marginRight: 15,
      },
      userInfo: {
        flexDirection: 'column',
      },
      userName: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 5,
      },
      userEmail: {
        fontSize: 14,
        color: '#666',
      },
});