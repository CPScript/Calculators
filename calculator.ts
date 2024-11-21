import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function calculate(op: string, num1: number, num2: number): number | string {
    switch (op) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        case '/':
            if (num2 !== 0) {
                return num1 / num2;
            } else {
                return 'Error: Division by zero';
            }
        default:
            return 'Error: Unsupported operation';
    }
}

function askQuestion(query: string): Promise<string> {
    return new Promise(resolve => rl.question(query, resolve));
}

async function main() {
    console.log("Simple Calculator");

    const input1 = await askQuestion("Enter first number: ");
    const num1 = parseFloat(input1);

    const operation = await askQuestion("Enter operation (+, -, *, /): ");

    const input2 = await askQuestion("Enter second number: ");
    const num2 = parseFloat(input2);

    const result = calculate(operation, num1, num2);
    console.log("Result:", result);

    rl.close();
}

main().catch(err => {
    console.error(err);
    rl.close();
});
