import AsyncStorage from "@react-native-async-storage/async-storage"
import axios from "axios"

const SERVER = 'https://haunguyen.pythonanywhere.com'

export const endpoints = {
    'login': '/o/token/',
    'menus': '/menus/',
    'current_user': '/users/current_user/'
}

export const Auth = (token) => axios.create({
    baseURL: SERVER,
    headers: {
        'Authorization': `Bearer ${token}`
    }
})

export default axios.create({
    baseURL: SERVER
})