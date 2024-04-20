import { View, Text } from "react-native";
import MyStyles from "../../styles/MyStyles";
import { useContext, useEffect } from "react";
import UserContext from "../../contexts/UserContext";

export default Home = () => {
    const [user, dispatch] = useContext(UserContext)
    return(
        <View style={MyStyles.container}>
            <Text>Home</Text>
            {
                user !== null && <Text>{user.first_name}</Text>
            }
        </View>
    );
}