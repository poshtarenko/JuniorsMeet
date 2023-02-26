package com.nyanband.university_organizer.dto.mapper;

import com.nyanband.university_organizer.dto.SaveUserSettingDto;
import com.nyanband.university_organizer.dto.UserSettingDto;
import com.nyanband.university_organizer.entity.UserSetting;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring",uses = {EntityIdMapper.class})
public interface UserSettingMapper {
    @Mapping(source = "userId", target = "user")
    UserSetting toEntity(SaveUserSettingDto userSettingDto);
    @Mapping(source = "user", target = "userId")
    UserSettingDto toDto (UserSetting userSetting);

}
