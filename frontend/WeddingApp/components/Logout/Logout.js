import { ActivityIndicator, Button, Text, View } from "react-native";
import MyStyles from "../../styles/MyStyles";
import { useContext, useReducer, useState } from "react";
import UserReducer from "../../reducers/UserReducer";
import UserContext from "../../contexts/UserContext";
import Home from "../Home/Home";

export default Logout = () =>{
    const [user, dispatch] = useContext(UserContext)

    const logout = async() => {
        // await AsyncStorage.removeItem('token')
        dispatch({
            'type': 'logout'
        })
        return <Home />
    }
    return <Button title="Logout" onPress={logout} />
}