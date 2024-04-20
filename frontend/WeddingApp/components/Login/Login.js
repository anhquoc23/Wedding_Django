import { ActivityIndicator, Alert, Button, Text, TouchableOpacity, View } from "react-native";
import MyStyles from "../../styles/MyStyles";
import { TextInput } from "react-native-gesture-handler";
import { useContext, useEffect, useState } from "react";
import Apis, { Auth, endpoints } from "../../configs/Apis";
import { LoginInfo } from "../../configs/Settings";
import AsyncStorage from "@react-native-async-storage/async-storage";
import UserContext from "../../contexts/UserContext";

export default Login = () =>{
    // state
    const [user, setUser] = useState(
        {
            "username": "",
            "password": ""
        })
    const [loading, setLoading] = useState(false)
    const [currentUser, dispatch] = useContext(UserContext)

    // function
    const changeInfo = (field, value) => {
        setUser(current => {
            return({
                ...current, [field]: value
            })
        })
    }

    const login = async () => {
        try {
            setLoading(true)
            // console.info(user)
            let {data} = await Apis.post(endpoints['login'], LoginInfo(user))
            console.log(data.access_token)
            await AsyncStorage.setItem('token', data.access_token)
            let res = await Auth(data.access_token).get(endpoints['current_user'])
            dispatch({
                'type': 'login',
                'payload': res.data
            })
        } catch(ex) {
            console.log(ex)
        } finally {
            setLoading(false)
            console.log('success')
        }
    }

    // useEffect
    


    return(
        <View style={MyStyles.container}>
            <Text>Login</Text>

            <TextInput placeholder="Enter your username..." onChangeText={evt => changeInfo('username', evt)} />
            <TextInput secureTextEntry={true} placeholder="Enter your username..." onChangeText={evt => changeInfo('password', evt)} />
            {
                loading ? <ActivityIndicator /> : 
                <TouchableOpacity onPress={login}>
                    <Text>Đăng Nhập</Text>
                </TouchableOpacity>
            }
            
        </View>
    );
}