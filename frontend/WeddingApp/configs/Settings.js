

const Config = {
    'CLIENT_ID': 'OGv9qjli4n6ObltJw8AGW4IlAEZecpI2qu0Rxdh9',
    'CLIENT_SECRET': 'RzKwHdgMqGw2jIuaaL6lxGqbl4uCpuE87Jsc33RIUUwdY4Ec6glAJLA5eJMPpiMtyHLMj61s9aG1dxOZbOuHnfynJ56ouF0LpieBbc785UquoCii24HNHvzJaz0hQylQ',

} 

export const LoginInfo = (user) => {
    return {
        'client_id': Config['CLIENT_ID'],
        'client_secret': Config['CLIENT_SECRET'],
        'username': user.username,
        'password': user.password,
        'grant_type': 'password'
    }
}