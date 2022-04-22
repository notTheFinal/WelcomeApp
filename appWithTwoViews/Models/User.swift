//
//  User.swift
//  appWithTwoViews
//
//  Created by Александр on 22.04.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getInfoAboutMe() -> User {
        User(login: "root",
             password: "root",
             person:
                Person(name: "Alexandr",
                       surname: "Baranchuk",
                       dateOfBirth: "28.11.2000",
                       education: [
                        Education(title: "ИрНИТУ, 4 курс, 'Информационная безопасность'", year: "2018г. - наст. вр."),
                        Education(title: "Лингвистическая школа 'Easy School', 'Разговорный английский'", year: "2019г. - 2021г."),
                        Education(title: "'ReactJS - Разработка WEB клиентских приложений' курс от SoftLine", year: "2021г."),
                        Education(title: "'Windows Server 2016' курс от SoftLine", year: "2021г."),
                        Education(title: "IOS-Developer курс Алексея Скуторенко", year: "2021г."),
                        Education(title: "IOS-Developer курс от SkillFactory", year: "09.2021 - 01.2022"),
                        Education(title: "IOS-Developer курс от SwiftBook❤️", year: "03.2022 - наст. вр.")
                       ],
                       hardSkills: [
                        "Работа с базами данных MongoDB, Postgres",
                        "Работа с виртуальными машинами на базе VMware",
                        "Работа с сетевой инфраструктурой предприятия",
                        "Программирование на языке Python",
                        "Программирование на языке 1С",
                        "Docker",
                        "GitHub (работа с ветками, Pull Requests, базовые автотесты)",
                        "Уровень английского - A2 (Pre Intermediate)"
                       ],
                       softSkills: [
                        "Легко обучаемый",
                        "Ответственный",
                        "Неконфликтный",
                        "Вежливый",
                        "Работа в команде",
                       ],
                       achievements: [
                        Achievement(title: "Всероссийский конкурс молодых предпринимателей", year: "2020г.", place: 1, link: nil),
                        Achievement(title: "Внутривузовский Хакатон инженерных решений", year: "2020г.", place: 2, link: nil),
                        Achievement(title: "Региональный Capture The Flag", year: "2020г.", place: 3, link: nil),
                        Achievement(title: "Стипендиат ИрНИТУ на основе рейтинговых достижений", year: "2021г. - наст. вр.", place: nil, link: nil),
                        Achievement(title: "Стипендиат Правительства РФ", year: "2021г. - наст. вр.", place: nil, link: nil),
                        Achievement(title: "Стипендиат Президента РФ", year: "2021г. - наст. вр.", place: nil, link: nil),
                        Achievement(title: "Стипендиат компании En+ Group", year: "2021г. - наст. вр.", place: nil, link: nil),
                        Achievement(title: "Внедрение разработанного проекта 'Умное расписание' в структуру ИрНИТУ", year: "2021г.", place: nil, link: "https://github.com/OneIdea-IRNITU/Smart-schedule-IRNITU"),
                        Achievement(title: "Внедрение разработанного проекта 'Мероприятия ИрНИТУ' в структуру ИрНИТУ", year: "2021г.", place: nil, link: "https://github.com/OneIdea-IRNITU/it_academy_web"),
                        Achievement(title: "'Security case cup' - соревнования по информационной безопасности 2021", year: "2021г.", place: 1, link: nil)
                       ]
                      )
            )
    }
}

struct Person {
    let name: String
    let surname: String
    let dateOfBirth: String
    let education: [Education]
    let hardSkills: [String]
    let softSkills: [String]
    let achievements: [Achievement]
}

struct Achievement {
    let title: String
    let year: String
    let place: Int?
    let link: String?
}

struct Education {
    let title: String
    let year: String
}
