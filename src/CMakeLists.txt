cmake_minimum_required(VERSION 3.2)

add_subdirectory(accesshttp)
add_subdirectory(accessrest)
add_subdirectory(accessws)
add_subdirectory(alertcenter)
add_subdirectory(cachecenter)
add_subdirectory(historyreader)
add_subdirectory(historywriter)
add_subdirectory(internalws)
add_subdirectory(logwriter)
add_subdirectory(marketindex)
add_subdirectory(marketprice)
add_subdirectory(matchengine)
add_subdirectory(monitoragent)
add_subdirectory(monitorcenter)
add_subdirectory(network)
add_subdirectory(tradesummary)
add_subdirectory(utils)

add_custom_target(AllTargets)
add_dependencies(AllTargets accesshttp accessrest accessws alertcenter cachecenter historyreader
        historywriter internalws logwriter marketindex marketprice matchengine monitoragent monitorcenter tradesummary
        )
