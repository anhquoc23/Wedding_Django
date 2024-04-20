import { createDrawerNavigator } from '@react-navigation/drawer';
import { NavigationContainer } from '@react-navigation/native';
import React, { useContext, useReducer, useState } from 'react';
import Home from './components/Home/Home';
import BookingHistory from './components/Booking History/BookingHistory';
import { Ionicons } from '@expo/vector-icons';
import CustomDrawer from './components/CustomDrawer/CustomDrawer';
import EditProfile from './components/EditProfile/EditProfile';
import ResetPassword from './components/ResetPassword/ResetPassword';
import Logout from './components/Logout/Logout';
import Login from './components/Login/Login';
import UserReducer from './reducers/UserReducer';
import UserContext from './contexts/UserContext';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { ActivityIndicator } from 'react-native';

const Drawer = createDrawerNavigator();



export default function App() {
  const [user, dispatch] = useReducer(UserReducer, null)

  return (
    <UserContext.Provider value={[user, dispatch]}>
      <NavigationContainer>
        <Drawer.Navigator
          drawerContent={(props) => <CustomDrawer {...props}
          />}
          initialRouteName='Home' screenOptions={{
            headerTitleAlign: 'center',
            headerStyle: {
              backgroundColor: '#ff00ff',
            },
            headerTintColor: '#f0ffff'
          }}>
          <Drawer.Screen
            name='Home'
            component={Home}
            options={{
              title: 'Dịch Vụ Đặt Tiệc', drawerIcon: ({ focused, color, size }) => (
                <Ionicons name={focused ? 'home' : 'home-outline'} size={size} color={color} />
              ),
              headerRight: () => (
                <Ionicons name="search" size={24} color={"white"} style={{ marginRight: 10 }} onPress={() => {
                  // Xử lý sự kiện khi click vào biểu tượng tìm kiếm
                }} />
              )
            }} />
          <Drawer.Screen
            name='BookingHistory'
            component={BookingHistory}
            options={{
              title: 'Lịch Sử Đặt Tiệc', drawerIcon: ({ focused, color, size }) => (
                <Ionicons name={focused ? 'time' : 'time-outline'} size={size} color={color} />
              )
            }} />
          
          {user === null ?
          <>
            <Drawer.Screen
          name='Login'
          component={Login}
          options={{
            title: 'Đăng Nhập', drawerIcon: ({ focused, color, size }) => (
              <Ionicons name={focused ? 'home' : 'home-outline'} size={size} color={color} />
            ),
            headerRight: () => (
              <Ionicons name="search" size={24} color={"white"} style={{ marginRight: 10 }} onPress={() => {
                // Xử lý sự kiện khi click vào biểu tượng tìm kiếm
              }} />
            )
          }} />
          <Drawer.Screen
            name='EditProfile'
            component={EditProfile}
            options={{
              title: 'Chỉnh sửa thông tin', drawerIcon: ({ focused, color, size }) => (
                <Ionicons name={focused ? 'settings' : 'settings-outline'} size={size} color={color} />
              )
            }} />
          
          <Drawer.Screen
            name='ResetPassword'
            component={ResetPassword}
            options={{
              title: 'Đổi mật khẩu', drawerIcon: ({ focused, color, size }) => (
                <Ionicons name={focused ? 'lock-closed' : 'lock-closed-outline'} size={size} color={color} />
              )
            }} />
          </>:
          <Drawer.Screen
          name='Logout'
          component={Logout}
          options={{
            title: 'Đăng xuất', drawerIcon: ({ focused, color, size }) => (
              <Ionicons name={focused ? 'log-out' : 'log-out-outline'} size={size} color={color} />
            )
          }}/>}
        </Drawer.Navigator>
      </NavigationContainer>
    </UserContext.Provider>
  );
}

