import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()

// MARK: - Appending

example(of: "append(Output...)") {
  let publisher = [1].publisher

  publisher
    .append(2, 3)
    .append(4)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "append(Output...) #2") {
  let publisher = PassthroughSubject<Int, Never>()

  publisher
    .append(3, 4)
    .append(5)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)

  publisher.send(1)
  publisher.send(2)
  publisher.send(completion: .finished)
}

example(of: "append(Sequence)") {
  let publisher = [1, 2, 3].publisher

  publisher
    .append([4, 5])
    .append(Set([6, 7]))
    .append(stride(from: 8, to: 11, by: 2))
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "append(Publisher)") {
  let publisher1 = [1, 2].publisher
  let publisher2 = [3, 4].publisher

  publisher1
    .append(publisher2)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}



// Copyright (c) 2019 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
