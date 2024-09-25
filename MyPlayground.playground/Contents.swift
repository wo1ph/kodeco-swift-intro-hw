struct Creature {
    var name: String
    var description: String
    var isGood: Bool
    var magicPower: Int
    
    var ability: String {
        let fibonacciAbilityNum = fibonacciAbility(n: magicPower)
        switch fibonacciAbilityNum {
        case 0:
            return "magic spell"
        case 1:
            return "strike"
        case 2:
            return "speed"
        case 3:
            return "shapeshifter"
        default:
            return "basic"
        }
    }
    
    func interactWith(_ creature: Creature) {
        switch(self.isGood) {
        case true:
            if creature.isGood {
                print("This \(self.name) has befriended the \(creature.name).")
            } else {
                print("This \(self.name) has been attacked by the \(creature.name)!")
            }
        case false:
            if creature.isGood {
                print("This \(self.name) has attacked the \(creature.name).")
            } else {
                print("This \(self.name) has teamed up with the \(creature.name) to do bad stuff!")
            }
        }
    }
    
    private func fibonacciAbility(n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        var previousFibNum = 0
        var currentFibNum = 1
        for _ in 2...n {
            let nextFibNum = previousFibNum + currentFibNum
            previousFibNum = currentFibNum
            currentFibNum = nextFibNum
        }
        return currentFibNum
    }
}

let werewolf = Creature(name: "Werewolf", description: "A human who can transfrom into a wolf.", isGood: false, magicPower: 4)
let unicorn = Creature(name: "Unicorn", description: "A majestic, horned horse-like animal.", isGood: true, magicPower: 0)
let mermaid = Creature(name: "Mermaid", description: "A humanoid with a human-like upper body and fish-like lower body, living in the depths of the ocean.", isGood: false, magicPower: 3)
let serpent = Creature(name: "Serpent", description: "A gigantic viper thought to be extinct.", isGood: false, magicPower: 2)

let creatureCatalog = [werewolf, unicorn, mermaid, serpent]

func describeCreature(_ creatures: [Creature]) {
    for creature in creatures {
        print("\(creature.name): \(creature.description)")
        print("\(creature.name) creatures are considered by most as \(creature.isGood ? "good": "evil").")
        print("\(creature.name) uses \(creature.ability) ability.")
        print("")
    }
    
    /* Loops through all of the creatures in the array
     * and has them interact with the others.
     * Goes through all the pairs, with each creature
     * acting as the "interactor" and the "interactee".
     */
    var i = 0;
    var j = 1;
    while i < creatures.count {
        while j < creatures.count {
            if i != j {
                creatures[i].interactWith(creatures[j])
            }
            j += 1
        }
        i += 1
        j = 0
    }
}

describeCreature(creatureCatalog)
