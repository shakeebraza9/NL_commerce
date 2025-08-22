export default function AboutStats() {
  const stats = [
    { number: "10K+", label: "Happy Customers", color: "text-blue-600" },
    { number: "5K+", label: "Products", color: "text-green-600" },
    { number: "50+", label: "Categories", color: "text-purple-600" },
    { number: "24/7", label: "Support", color: "text-orange-600" },
  ]

  return (
    <section className="py-16 bg-gray-50">
      <div className="max-w-6xl mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8 text-center">
          {stats.map((stat, index) => (
            <div key={index} className="p-6 bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow">
              <div className={`text-4xl font-bold ${stat.color} mb-2`}>{stat.number}</div>
              <div className="text-gray-600">{stat.label}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
