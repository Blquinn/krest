add_executable(krest
    main.cpp
    contents/model/paramrow.cpp
    contents/model/paramtablemodel.cpp
    contents/model/rootmodel.cpp
    contents/model/requestmodel.cpp
    contents/client/httpclient.cpp
    resources.qrc
)
target_link_libraries(krest Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick Qt5::QuickControls2 Qt5::Svg KF5::I18n)
install(TARGETS krest ${KF5_INSTALL_TARGETS_DEFAULT_ARGS})
