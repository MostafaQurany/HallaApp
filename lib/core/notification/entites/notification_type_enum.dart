enum MyNotificationType {
  contact,
  important,
  chatMessage,
  notification,
  none,
}

MyNotificationType getMyNotificationType(String name) {
  switch (name.toLowerCase()) {
    case 'contact':
      return MyNotificationType.contact;
    case 'important':
      return MyNotificationType.important;
    case 'chat message':
      return MyNotificationType.chatMessage;
    case 'notification':
      return MyNotificationType.notification;
    default:
      return MyNotificationType.none;
  }
}
