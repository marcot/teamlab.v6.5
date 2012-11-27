insert ignore into core_user(id, firstname, lastname, username, tenant, last_modified) values ('00000000-0000-0000-0000-000000000ace','admin','','admin',0,utc_timestamp());
insert ignore into core_usersecurity(tenant, userid, pwdhash, pwdhashsha512) values (0,'00000000-0000-0000-0000-000000000ace','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','l/DFJ5yg4oh1F6Qp7uDhBw==');
insert ignore into core_usergroup(tenant, userid, groupid, ref_type) values (0,'00000000-0000-0000-0000-000000000ace','cd84e66b-b803-40fc-99f9-b2969a54a1de',0);

insert ignore into tenants_tenants(id, alias, name, creationdatetime, owner_id) values (0,'localhost','Intranet portal',UTC_TIMESTAMP(), '00000000-0000-0000-0000-000000000ace');
update tenants_tenants set id = 0 where id = 1;
insert ignore into tenants_quota (tenant, name, max_file_size, max_total_size, active_users) values (-1, 'Default', 100, 102400, 100000);

insert ignore into core_settings(tenant, id, value) values (-1, 'SmtpSettings', 0xF052E090A1A3750DADCD4E9961DA04AAF74059304D63A7395E32F788AA4732408A43879439C7045CA5A738039B4ED813D4978B53EEC54D2689FDF2AB9C1A71CBB3523A224DAC89FE455C368972B379590C3C0E53ECC55B1E7A026C822237D9894E9BF137D426F10E0C424F3E16F2A464);

-- subscribe all users to what's new notifications
insert ignore into core_subscription(source, action, recipient, object, tenant) values('asc.web.studio','send_whats_new','abef62db-11a8-4673-9d32-ef1d8af19dc0','',-1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values('asc.web.studio','send_whats_new','abef62db-11a8-4673-9d32-ef1d8af19dc0','email.sender',-1);
-- subscribe all users to new events
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('6504977c-75af-4691-9099-084d3ddeea04','new feed','abef62db-11a8-4673-9d32-ef1d8af19dc0','',-1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values('6504977c-75af-4691-9099-084d3ddeea04','new feed','abef62db-11a8-4673-9d32-ef1d8af19dc0','email.sender|messanger.sender',-1);
-- subscribe all users to new blogs
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('6a598c74-91ae-437d-a5f4-ad339bd11bb2','new post','abef62db-11a8-4673-9d32-ef1d8af19dc0','',-1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values('6a598c74-91ae-437d-a5f4-ad339bd11bb2','new post','abef62db-11a8-4673-9d32-ef1d8af19dc0','email.sender|messanger.sender',-1);
-- subscribe all users to new forum
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('853b6eb9-73ee-438d-9b09-8ffeedf36234', 'new topic in forum', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('853b6eb9-73ee-438d-9b09-8ffeedf36234', 'new topic in forum', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe all users to photos
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('9d51954f-db9b-4aed-94e3-ed70b914e101', 'new photo uploaded', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('9d51954f-db9b-4aed-94e3-ed70b914e101', 'new photo uploaded', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe all users to bookmarks
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('28b10049-dd20-4f54-b986-873bc14ccfc7', 'new bookmark created', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('28b10049-dd20-4f54-b986-873bc14ccfc7', 'new bookmark created', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe all users to wiki
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('742cf945-cbbc-4a57-82d6-1600a12cf8ca', 'new wiki page', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('742cf945-cbbc-4a57-82d6-1600a12cf8ca', 'new wiki page', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe all users to documents
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('6fe286a4-479e-4c25-a8d9-0156e332b0c0', 'sharedocument', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('6fe286a4-479e-4c25-a8d9-0156e332b0c0', 'sharefolder', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6fe286a4-479e-4c25-a8d9-0156e332b0c0', 'sharedocument', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6fe286a4-479e-4c25-a8d9-0156e332b0c0', 'sharefolder', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6fe286a4-479e-4c25-a8d9-0156e332b0c0', 'updatedocument', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe all users to projects
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'invitetoproject', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'milestonedeadline', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'newcommentformessage', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'newcommentformilestone', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'newcommentfortask', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'projectcreaterequest', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'projecteditrequest', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'removefromproject', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'responsibleforproject', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'responsiblefortask', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('6045b68c-2c2e-42db-9e53-c272e814c4ad', 'taskclosed', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe all users to calendar events
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('40650da3-f7c1-424c-8c89-b9c115472e08', 'calendar_sharing', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('40650da3-f7c1-424c-8c89-b9c115472e08', 'event_alert', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('40650da3-f7c1-424c-8c89-b9c115472e08', 'calendar_sharing', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('40650da3-f7c1-424c-8c89-b9c115472e08', 'event_alert', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
-- subscribe admin group to admin notifications
insert ignore into core_subscription(source, action, recipient, object, tenant) values('asc.web.studio','admin_notify','cd84e66b-b803-40fc-99f9-b2969a54a1de','',-1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values('asc.web.studio','admin_notify','cd84e66b-b803-40fc-99f9-b2969a54a1de','email.sender',-1);
-- subscribe all users to crm
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'SetAccess', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'SetAccess', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'ResponsibleForTask', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'ResponsibleForTask', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'AddRelationshipEvent', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'AddRelationshipEvent', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'ExportCompleted', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'ExportCompleted', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);
insert ignore into core_subscription(source, action, recipient, object, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'CreateNewContact', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '', -1);
insert ignore into core_subscriptionmethod(source, action, recipient, sender, tenant) values ('13ff36fb-0272-4887-b416-74f52b0d0b02', 'CreateNewContact', 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'email.sender|messanger.sender', -1);

-- default permissions
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, '5d5b7260-f7f7-49f1-a1c9-95fbb6a12604', 'ef5e6790-f346-4b6e-b662-722bc28cb0db', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, '5d5b7260-f7f7-49f1-a1c9-95fbb6a12604', 'f11e8f3f-46e6-4e55-90e3-09c22ec565bd', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '088d5940-a80f-4403-9741-d610718ce95c', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '08d66144-e1c9-4065-9aa1-aa4bba0a7bc8', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '08d75c97-cf3f-494b-90d1-751c941fe2dd', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '0d1f72a8-63da-47ea-ae42-0900e4ac72a9', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '13e30b51-5b4d-40a5-8575-cb561899eeb1', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '19f658ae-722b-4cd8-8236-3ad150801d96', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '2c6552b3-b2e0-4a00-b8fd-13c161e337b1', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '388c29d3-c662-4a61-bf47-fc2f7094224a', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '40bf31f4-3132-4e76-8d5c-9828a89501a3', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '49ae8915-2b30-4348-ab74-b152279364fb', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '63e9f35f-6bb5-4fb1-afaa-e4c2f4dec9bd', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '9018c001-24c2-44bf-a1db-d1121a570e74', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '948ad738-434b-4a88-8e38-7569d332910a', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', '9d75a568-52aa-49d8-ad43-473756cd8903', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'a362fe79-684e-4d43-a599-65bc1f4e167f', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'c426c349-9ad4-47cd-9b8f-99fc30675951', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'd11ebcb9-0e6e-45e6-a6d0-99c41d687598', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'd1f3b53d-d9e2-4259-80e7-d24380978395', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'd49f4e30-da10-4b39-bc6d-b41ef6e039d3', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'd852b66f-6719-45e1-8657-18f0bb791690', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'e0759a42-47f0-4763-a26a-d5aa665bec35', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'e37239bd-c5b5-4f1e-a9f8-3ceeac209615', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'fbc37705-a04c-40ad-a68c-ce2f0423f397', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'abef62db-11a8-4673-9d32-ef1d8af19dc0', 'fcac42b8-9386-48eb-a938-d19b3c576912', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', '13e30b51-5b4d-40a5-8575-cb561899eeb1', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', '49ae8915-2b30-4348-ab74-b152279364fb', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', '63e9f35f-6bb5-4fb1-afaa-e4c2f4dec9bd', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', '9018c001-24c2-44bf-a1db-d1121a570e74', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', 'd1f3b53d-d9e2-4259-80e7-d24380978395', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', 'e0759a42-47f0-4763-a26a-d5aa665bec35', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', 'e37239bd-c5b5-4f1e-a9f8-3ceeac209615', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', 'f11e88d7-f185-4372-927c-d88008d2c483', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'ba74ca02-873f-43dc-8470-8620c156bc67', 'f11e8f3f-46e6-4e55-90e3-09c22ec565bd', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '00e7dfc5-ac49-4fd3-a1d6-98d84e877ac4', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '14be970f-7af5-4590-8e81-ea32b5f7866d', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '18ecc94d-6afa-4994-8406-aee9dff12ce2', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '298530eb-435e-4dc6-a776-9abcd95c70e9', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '430eaf70-1886-483c-a746-1a18e3e6bb63', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '557d6503-633b-4490-a14c-6473147ce2b3', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '724cbb75-d1c9-451e-bae0-4de0db96b1f7', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '7cb5c0d1-d254-433f-abe3-ff23373ec631', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '91b29dcd-9430-4403-b17a-27d09189be88', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', 'a18480a4-6d18-4c71-84fa-789888791f45', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', 'b630d29b-1844-4bda-bbbe-cf5542df3559', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', 'c62a9e8d-b24c-4513-90aa-7ff0f8ba38eb', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', 'd7cdb020-288b-41e5-a857-597347618533', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, '712d9ec3-5d2b-4b13-824f-71f00191dcca', 'e0759a42-47f0-4763-a26a-d5aa665bec35', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '0000ffff-ae36-4d2e-818d-726cb650aeb7', 'ASC.Web.Studio.Core.TcpIpFilterSecurityObject|0000:0000:0000:0000:0000:0000:0000:0000', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'bba32183-a14d-48ed-9d39-c6b4d8925fbf', '0d68b142-e20a-446e-a832-0d6b0b65a164', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '6f05c382-8bca-4469-9424-c807a98c40d7', '', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|1e04460243b54d7982f3fd6208a11960', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|6743007c6f954d208c88a8601ce5e76d', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|e67be73df9ae4ce18fec1880cb518cb4', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|ea942538e68e49079394035336ee0ba8', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|32d24cb57ece46069c9419216ba42086', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|bf88953e3c434850a3fbb1e43ad53a3e', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|2a9230378b2d487b9a225ac0918acf3f', 0);
insert ignore into core_acl (tenant, subject, action, object, acetype) values (-1, 'c5cc67d1-c3e8-43c0-a3ad-3928ae3e5b5e', '77777777-32ae-425f-99b5-83176061d1ae', 'ASC.Web.Core.WebItemSecurity+WebItemSecurityObject|f4d98afdd336433287783c6945c81ea0', 0);

-- restricted tenant names
insert ignore into tenants_forbiden (address) values ('about');
insert ignore into tenants_forbiden (address) values ('api');
insert ignore into tenants_forbiden (address) values ('asset');
insert ignore into tenants_forbiden (address) values ('audio');
insert ignore into tenants_forbiden (address) values ('aws');
insert ignore into tenants_forbiden (address) values ('blogs');
insert ignore into tenants_forbiden (address) values ('business');
insert ignore into tenants_forbiden (address) values ('buzz');
insert ignore into tenants_forbiden (address) values ('calendar');
insert ignore into tenants_forbiden (address) values ('client');
insert ignore into tenants_forbiden (address) values ('clients');
insert ignore into tenants_forbiden (address) values ('community');
insert ignore into tenants_forbiden (address) values ('data');
insert ignore into tenants_forbiden (address) values ('db');
insert ignore into tenants_forbiden (address) values ('dev');
insert ignore into tenants_forbiden (address) values ('developer');
insert ignore into tenants_forbiden (address) values ('developers');
insert ignore into tenants_forbiden (address) values ('doc');
insert ignore into tenants_forbiden (address) values ('docs');
insert ignore into tenants_forbiden (address) values ('download');
insert ignore into tenants_forbiden (address) values ('downloads');
insert ignore into tenants_forbiden (address) values ('e-mail');
insert ignore into tenants_forbiden (address) values ('feed');
insert ignore into tenants_forbiden (address) values ('feeds');
insert ignore into tenants_forbiden (address) values ('file');
insert ignore into tenants_forbiden (address) values ('files');
insert ignore into tenants_forbiden (address) values ('flash');
insert ignore into tenants_forbiden (address) values ('forum');
insert ignore into tenants_forbiden (address) values ('forumsforumblog');
insert ignore into tenants_forbiden (address) values ('help');
insert ignore into tenants_forbiden (address) values ('jabber');
insert ignore into tenants_forbiden (address) values ('localhost');
insert ignore into tenants_forbiden (address) values ('mail');
insert ignore into tenants_forbiden (address) values ('management');
insert ignore into tenants_forbiden (address) values ('manual');
insert ignore into tenants_forbiden (address) values ('media');
insert ignore into tenants_forbiden (address) values ('movie');
insert ignore into tenants_forbiden (address) values ('music');
insert ignore into tenants_forbiden (address) values ('my');
insert ignore into tenants_forbiden (address) values ('nct');
insert ignore into tenants_forbiden (address) values ('net');
insert ignore into tenants_forbiden (address) values ('network');
insert ignore into tenants_forbiden (address) values ('new');
insert ignore into tenants_forbiden (address) values ('news');
insert ignore into tenants_forbiden (address) values ('office');
insert ignore into tenants_forbiden (address) values ('online-help');
insert ignore into tenants_forbiden (address) values ('onlinehelp');
insert ignore into tenants_forbiden (address) values ('organizer');
insert ignore into tenants_forbiden (address) values ('plan');
insert ignore into tenants_forbiden (address) values ('plans');
insert ignore into tenants_forbiden (address) values ('press');
insert ignore into tenants_forbiden (address) values ('project');
insert ignore into tenants_forbiden (address) values ('projects');
insert ignore into tenants_forbiden (address) values ('radio');
insert ignore into tenants_forbiden (address) values ('reg');
insert ignore into tenants_forbiden (address) values ('registration');
insert ignore into tenants_forbiden (address) values ('rss');
insert ignore into tenants_forbiden (address) values ('security');
insert ignore into tenants_forbiden (address) values ('share');
insert ignore into tenants_forbiden (address) values ('source');
insert ignore into tenants_forbiden (address) values ('stat');
insert ignore into tenants_forbiden (address) values ('static');
insert ignore into tenants_forbiden (address) values ('stream');
insert ignore into tenants_forbiden (address) values ('support');
insert ignore into tenants_forbiden (address) values ('talk');
insert ignore into tenants_forbiden (address) values ('task');
insert ignore into tenants_forbiden (address) values ('tasks');
insert ignore into tenants_forbiden (address) values ('teamlab');
insert ignore into tenants_forbiden (address) values ('time');
insert ignore into tenants_forbiden (address) values ('tools');
insert ignore into tenants_forbiden (address) values ('user-manual');
insert ignore into tenants_forbiden (address) values ('usermanual');
insert ignore into tenants_forbiden (address) values ('video');
insert ignore into tenants_forbiden (address) values ('wave');
insert ignore into tenants_forbiden (address) values ('wiki');
insert ignore into tenants_forbiden (address) values ('wikis');