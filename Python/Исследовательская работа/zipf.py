import re
import plotly.graph_objects as go
import matplotlib.pyplot as plt
if __name__ == '__main__':
    dictionary = {}
    items = {
        'words': [],
        'values': [],
        'rates': [],
        'rate': [],
        'multiplication_rate': []
    }
    with open("Story.txt", 'r') as book:
        line = book.readline()
        punctuations = ['(', ')', ';', ':', '[', ']', ',', '!', '?', '']
        word_count = 0
        while line:
            tokens = re.split('[ ()\';:\[\]!?,\n\t.]', line)
            line = book.readline()
            words = [word.lower() for word in tokens if word not in punctuations and word != '']
            word_count += len(words)
            for word in words:
                if word in dictionary:
                    dictionary[word] += 1
                else:
                    dictionary[word] = 1
        i = 0
        for key, value in sorted(dictionary.items(), key=lambda item: item[1], reverse=True):
            i += 1
            items['words'].append(key)
            items['values'].append(value)
            items['rates'].append(i)
        for index in range(0, len(items['words']) - 1):
            coef = float(items['values'][index] / word_count)
            items['rate'].append(coef)
            items['multiplication_rate'].append(float(items['rates'][index] * coef))

    table = go.Figure(data=[go.Table(header=dict(values=['Слово', 'Сколько раз встречается', 'Место', 'Частота встречаемости', 'Место * Частота']), cells=dict(values=[items['words'], items['values'], items['rates'], items['rate'], items['multiplication_rate']]))])
plt.plot(items['rate'], items['rates'][0:len(items['rates'])-1])
ax = plt.gca()
ax.set_xlabel("Ранг", fontsize=10, color='blue', labelpad=0)    # +
ax.set_ylabel("Частота встречаемости слова", fontsize=10, color='orange', labelpad=0)  # +

plt.show()


table.show()
