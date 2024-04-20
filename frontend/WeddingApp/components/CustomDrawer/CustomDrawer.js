import { Image, View, Text } from "react-native";
import DrawerStyles from "./DrawerStyles";
import { DrawerContentScrollView, DrawerItemList } from "@react-navigation/drawer";
import { useContext } from "react";
import UserContext from "../../contexts/UserContext";

export default CustomDrawer = props => {
    const [user, dispatch] = useContext(UserContext)

    return (
        <DrawerContentScrollView {...props}>
            {user !== null &&
                <View style={DrawerStyles.container}>
                    <Image source={{ uri: "https://thanhduong.pythonanywhere.com/static/courses/2022/04/Lighthouse.jpg" }} style={DrawerStyles.avatar} />
                    <View style={DrawerStyles.userInfo}>
                        <Text style={DrawerStyles.userName}>{user.first_name}</Text>
                        <Text style={DrawerStyles.userEmail}>{user.email}</Text>
                    </View>
                </View>
            }
            <View>
                <DrawerItemList {...props} />
            </View>
        </DrawerContentScrollView>
    )
}