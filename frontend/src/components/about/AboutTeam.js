export default function AboutTeam() {
  const team = [
    { name: "John Smith", role: "CEO & Founder", emoji: "👨‍💼" },
    { name: "Sarah Johnson", role: "Head of Operations", emoji: "👩‍💻" },
    { name: "Mike Davis", role: "Creative Director", emoji: "👨‍🎨" },
  ]

  return (
    <section className="py-16 bg-gray-50">
      <div className="max-w-6xl mx-auto px-4">
        <h2 className="text-3xl font-bold text-center text-gray-900 mb-12">Our Team</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {team.map((member, index) => (
            <div
              key={index}
              className="text-center bg-white p-8 rounded-lg border border-gray-200 hover:shadow-md transition-shadow"
            >
              <div className="w-32 h-32 bg-gray-100 rounded-full mx-auto mb-4 flex items-center justify-center">
                <span className="text-4xl">{member.emoji}</span>
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-2">{member.name}</h3>
              <p className="text-gray-600">{member.role}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
