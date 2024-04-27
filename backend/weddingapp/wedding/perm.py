from rest_framework.permissions import BasePermission, IsAuthenticated
from .configs import GROUP_NAME
from .dao import get_groups_by_user


class AuthenticateIsEmployeeORADMIN(IsAuthenticated):
    def has_permission(self, request, view):
        if request.user.is_superuser:
            return True
        groups_all = [group.name for group in get_groups_by_user(request.user)]
        return any(group == GROUP_NAME['EMPLOYEE'] for group in groups_all)